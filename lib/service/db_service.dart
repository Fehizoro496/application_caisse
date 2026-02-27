import 'package:application_caisse/model/releve_model.dart';
import 'package:application_caisse/model/prelevement_model.dart';
import 'package:application_caisse/view/widget/modern_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application_caisse/persistance/database.dart';
import 'package:application_caisse/model/operation_model.dart';
import 'package:application_caisse/model/depense_model.dart';
import 'package:drift/src/runtime/data_class.dart' as drift_data_class;
import 'dart:io';
import 'package:path/path.dart' as p;
// import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:drift/drift.dart';

class DBService extends GetxService {
  late AppDatabase database;

  Future<DBService> init() async {
    database = AppDatabase();
    return this;
  }

  Future<int> saveDepense(DepenseModel depense) async {
    return await database.into(database.depenses).insert(
        DepensesCompanion.insert(
            idDepense: generateUid(),
            libelle: depense.libelle,
            montant: depense.montant,
            dateDepense: depense.dateDepense ?? DateTime.timestamp()));
  }

  Future<String> saveOperation(OperationModel operation) async {
    final String id = generateUid();
    await database.into(database.operations).insert(OperationsCompanion.insert(
        idOperation: id,
        nomOperation: operation.nomOperation,
        prixOperation: operation.prixOperation,
        quantiteOperation: operation.quantiteOperation,
        dateOperation: operation.dateOperation ?? DateTime.timestamp()));
    return id;
  }

  Future<String> saveFacture({required String client, DateTime? date}) async {
    final factureDate = date ?? DateTime.now();
    final String ref = await _generateFactureRef(client, factureDate);

    await database.into(database.factures).insert(FacturesCompanion.insert(
        idFacture: ref, client: client, dateFacture: factureDate));
    return ref;
  }

  Future<String> _generateFactureRef(String client, DateTime date) async {
    // Extraire les initiales du client (max 3 lettres)
    final initials = client
        .trim()
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .map((w) => w[0].toUpperCase())
        .take(3)
        .join();

    // Utiliser 'X' si pas d'initiales
    final clientCode = initials.isEmpty ? 'X' : initials;

    // Formater la date en AAAAMMJJ
    final dateStr =
        '${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';

    // Compter les factures existantes avec ce prefixe
    final prefix = '$clientCode-$dateStr';
    final existing = await (database.select(database.factures)
          ..where((t) => t.idFacture.like('$prefix%')))
        .get();

    final sequence = (existing.length + 1).toString().padLeft(3, '0');

    return '$prefix-$sequence';
  }

  Future<Operation?> getOperationById(String id) {
    return (database.select(database.operations)
          ..where((tbl) => tbl.idOperation.equals(id)))
        .getSingleOrNull();
  }

  Future<void> assignFactureInOperation(
      String operationID, String factureID) async {
    final operation = await getOperationById(operationID);
    if (operation != null) {
      await (database.update(database.operations)
            ..where((tbl) => tbl.idOperation.equals(operationID)))
          .write(
        OperationsCompanion(
          facture: drift_data_class.Value(factureID),
        ),
      );
    }
  }

  Future<List<Operation>> getAllOperations() async {
    List<Operation> out = await database.select(database.operations).get();
    return out;
  }

  Future<List<Prelevement>> getAllPrelevements() async {
    List<Prelevement> out = await database.select(database.prelevements).get();
    return out;
  }

  Future<int> savePrelevement(PrelevementModel prelevement) async {
    return await database.into(database.prelevements).insert(
        PrelevementsCompanion.insert(
            idPrelevement: generateUid(),
            montant: prelevement.montant,
            datePrelevement:
                prelevement.datePrelevement ?? DateTime.timestamp()));
  }

  Future<List<Releve>> getAllReleves() async {
    List<Releve> out = await database.select(database.releves).get();
    return out;
  }

  Future<int> saveReleve(ReleveModel releve) async {
    return await database.into(database.releves).insert(RelevesCompanion.insert(
        idReleve: generateUid(),
        compteur: releve.compteur,
        sousCompteur: releve.sousCompteur,
        dateReleve: releve.dateReleve ?? DateTime.timestamp()));
  }

  Future<bool> backupDatabaseToDesktop() async {
    try {
      final dbFolder = await getApplicationCacheDirectory();
      final dbFile = File(p.join(dbFolder.path, 'caisse_database.sqlite'));

      final List<int> databaseContent = await dbFile.readAsBytes();

      final key = encrypt.Key.fromSecureRandom(32);
      final iv = encrypt.IV.fromSecureRandom(16);
      final encrypter = encrypt.Encrypter(encrypt.AES(key));

      final encrypted = encrypter.encryptBytes(databaseContent, iv: iv);

      final desktopPath =
          "C:\\Users\\${Platform.environment['USERNAME']}\\Desktop";
      final timestamp = DateTime.now()
          .toString()
          .replaceAll(RegExp(r'[:-]'), '_')
          .split('.')
          .first;
      final backupFile = File('$desktopPath\\backup_caisse_$timestamp.enc');

      // Format : [16 bytes IV][32 bytes KEY][données cryptées]
      await backupFile.writeAsBytes(
          [...iv.bytes, ...key.bytes, ...encrypted.bytes]).then((_) {
        ModernSnackBar.showSuccess(
            'Exportation effectuée', 'Exportation effectuée avec succès!');
      }).catchError((error) {
        ModernSnackBar.showError(
            "Erreur", "Une erreur est survenue lors de l'exportation!");
      });

      return true;
    } catch (e) {
      print('Error backing up database: $e');
      return false;
    }
  }

  // Fonction pour décrypter (à utiliser lors de la restauration)
  Future<List<int>> decryptBackup(String backupPath) async {
    try {
      final backupFile = File(backupPath);
      final List<int> encryptedData = await backupFile.readAsBytes();

      // Extraire IV et données cryptées
      final ivBytes = encryptedData.sublist(0, 16);
      final encryptedBytes = encryptedData.sublist(16);

      final key = encrypt.Key.fromLength(32);
      final iv = encrypt.IV(Uint8List.fromList(ivBytes));
      final encrypter = encrypt.Encrypter(encrypt.AES(key));

      final decrypted = encrypter.decryptBytes(
          encrypt.Encrypted(Uint8List.fromList(encryptedBytes)),
          iv: iv);

      return decrypted;
    } catch (e) {
      print('Error decrypting backup: $e');
      rethrow;
    }
  }

  Future<bool> importAndMergeDatabase(String backupPath) async {
    try {
      // Décrypter le fichier de backup
      final decryptedData = await decryptBackup(backupPath);

      // Créer un fichier temporaire pour la base de données importée
      final tempDir = await getTemporaryDirectory();
      final tempDbFile = File(p.join(tempDir.path, 'temp_import.sqlite'));
      await tempDbFile.writeAsBytes(decryptedData);

      // Ouvrir la base de données temporaire
      final importedDb = AppDatabase.fromFile(tempDbFile);

      // Récupérer toutes les données de la base importée
      final importedOperations =
          await importedDb.select(importedDb.operations).get();
      final importedDepenses =
          await importedDb.select(importedDb.depenses).get();
      final importedPrelevements =
          await importedDb.select(importedDb.prelevements).get();
      final importedReleves = await importedDb.select(importedDb.releves).get();
      final importedFactures =
          await importedDb.select(importedDb.factures).get();

      // Commencer la fusion des données dans une transaction
      await database.transaction(() async {
        // Fusionner les opérations
        for (final op in importedOperations) {
          final exists = await (database.select(database.operations)
                ..where((t) => t.idOperation.equals(op.idOperation)))
              .getSingleOrNull();
          if (exists == null) {
            await database.into(database.operations).insert(op);
          }
        }

        // Fusionner les dépenses
        for (final dep in importedDepenses) {
          final exists = await (database.select(database.depenses)
                ..where((t) => t.idDepense.equals(dep.idDepense)))
              .getSingleOrNull();
          if (exists == null) {
            await database.into(database.depenses).insert(dep);
          }
        }

        // Fusionner les prélèvements
        for (final prel in importedPrelevements) {
          final exists = await (database.select(database.prelevements)
                ..where((t) => t.idPrelevement.equals(prel.idPrelevement)))
              .getSingleOrNull();
          if (exists == null) {
            await database.into(database.prelevements).insert(prel);
          }
        }

        // Fusionner les relevés
        for (final rel in importedReleves) {
          final exists = await (database.select(database.releves)
                ..where((t) => t.idReleve.equals(rel.idReleve)))
              .getSingleOrNull();
          if (exists == null) {
            await database.into(database.releves).insert(rel);
          }
        }

        // Fusionner les factures
        for (final fac in importedFactures) {
          final exists = await (database.select(database.factures)
                ..where((t) => t.idFacture.equals(fac.idFacture)))
              .getSingleOrNull();
          if (exists == null) {
            await database.into(database.factures).insert(fac);
          }
        }
      });

      Get.close(1);
      ModernSnackBar.showSuccess(
        'Importation réussie',
        'Les données ont été fusionnées avec succès!',
      );

      return true;
    } catch (e) {
      print('Error importing database: $e');
      ModernSnackBar.showError(
        'Erreur',
        "Erreur lors de l'importation des données",
      );
      return false;
    }
  }
}
// dart run drift_dev schema dump lib/persistance/database.dart db_schemas
// dart run build_runner build --delete-conflicting-outputs
