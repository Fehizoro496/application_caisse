// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UtilisateursTable extends Utilisateurs
    with TableInfo<$UtilisateursTable, Utilisateur> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UtilisateursTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idUtilisateurMeta =
      const VerificationMeta('idUtilisateur');
  @override
  late final GeneratedColumn<int> idUtilisateur = GeneratedColumn<int>(
      'id_utilisateur', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nomUtilisateurMeta =
      const VerificationMeta('nomUtilisateur');
  @override
  late final GeneratedColumn<String> nomUtilisateur = GeneratedColumn<String>(
      'nom_utilisateur', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _motDePasseUtilisateurMeta =
      const VerificationMeta('motDePasseUtilisateur');
  @override
  late final GeneratedColumn<String> motDePasseUtilisateur =
      GeneratedColumn<String>('mot_de_passe_utilisateur', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idUtilisateur, nomUtilisateur, motDePasseUtilisateur];
  @override
  String get aliasedName => _alias ?? 'utilisateurs';
  @override
  String get actualTableName => 'utilisateurs';
  @override
  VerificationContext validateIntegrity(Insertable<Utilisateur> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_utilisateur')) {
      context.handle(
          _idUtilisateurMeta,
          idUtilisateur.isAcceptableOrUnknown(
              data['id_utilisateur']!, _idUtilisateurMeta));
    }
    if (data.containsKey('nom_utilisateur')) {
      context.handle(
          _nomUtilisateurMeta,
          nomUtilisateur.isAcceptableOrUnknown(
              data['nom_utilisateur']!, _nomUtilisateurMeta));
    } else if (isInserting) {
      context.missing(_nomUtilisateurMeta);
    }
    if (data.containsKey('mot_de_passe_utilisateur')) {
      context.handle(
          _motDePasseUtilisateurMeta,
          motDePasseUtilisateur.isAcceptableOrUnknown(
              data['mot_de_passe_utilisateur']!, _motDePasseUtilisateurMeta));
    } else if (isInserting) {
      context.missing(_motDePasseUtilisateurMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idUtilisateur};
  @override
  Utilisateur map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Utilisateur(
      idUtilisateur: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_utilisateur'])!,
      nomUtilisateur: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}nom_utilisateur'])!,
      motDePasseUtilisateur: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}mot_de_passe_utilisateur'])!,
    );
  }

  @override
  $UtilisateursTable createAlias(String alias) {
    return $UtilisateursTable(attachedDatabase, alias);
  }
}

class Utilisateur extends DataClass implements Insertable<Utilisateur> {
  final int idUtilisateur;
  final String nomUtilisateur;
  final String motDePasseUtilisateur;
  const Utilisateur(
      {required this.idUtilisateur,
      required this.nomUtilisateur,
      required this.motDePasseUtilisateur});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_utilisateur'] = Variable<int>(idUtilisateur);
    map['nom_utilisateur'] = Variable<String>(nomUtilisateur);
    map['mot_de_passe_utilisateur'] = Variable<String>(motDePasseUtilisateur);
    return map;
  }

  UtilisateursCompanion toCompanion(bool nullToAbsent) {
    return UtilisateursCompanion(
      idUtilisateur: Value(idUtilisateur),
      nomUtilisateur: Value(nomUtilisateur),
      motDePasseUtilisateur: Value(motDePasseUtilisateur),
    );
  }

  factory Utilisateur.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Utilisateur(
      idUtilisateur: serializer.fromJson<int>(json['idUtilisateur']),
      nomUtilisateur: serializer.fromJson<String>(json['nomUtilisateur']),
      motDePasseUtilisateur:
          serializer.fromJson<String>(json['motDePasseUtilisateur']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idUtilisateur': serializer.toJson<int>(idUtilisateur),
      'nomUtilisateur': serializer.toJson<String>(nomUtilisateur),
      'motDePasseUtilisateur': serializer.toJson<String>(motDePasseUtilisateur),
    };
  }

  Utilisateur copyWith(
          {int? idUtilisateur,
          String? nomUtilisateur,
          String? motDePasseUtilisateur}) =>
      Utilisateur(
        idUtilisateur: idUtilisateur ?? this.idUtilisateur,
        nomUtilisateur: nomUtilisateur ?? this.nomUtilisateur,
        motDePasseUtilisateur:
            motDePasseUtilisateur ?? this.motDePasseUtilisateur,
      );
  @override
  String toString() {
    return (StringBuffer('Utilisateur(')
          ..write('idUtilisateur: $idUtilisateur, ')
          ..write('nomUtilisateur: $nomUtilisateur, ')
          ..write('motDePasseUtilisateur: $motDePasseUtilisateur')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idUtilisateur, nomUtilisateur, motDePasseUtilisateur);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Utilisateur &&
          other.idUtilisateur == this.idUtilisateur &&
          other.nomUtilisateur == this.nomUtilisateur &&
          other.motDePasseUtilisateur == this.motDePasseUtilisateur);
}

class UtilisateursCompanion extends UpdateCompanion<Utilisateur> {
  final Value<int> idUtilisateur;
  final Value<String> nomUtilisateur;
  final Value<String> motDePasseUtilisateur;
  const UtilisateursCompanion({
    this.idUtilisateur = const Value.absent(),
    this.nomUtilisateur = const Value.absent(),
    this.motDePasseUtilisateur = const Value.absent(),
  });
  UtilisateursCompanion.insert({
    this.idUtilisateur = const Value.absent(),
    required String nomUtilisateur,
    required String motDePasseUtilisateur,
  })  : nomUtilisateur = Value(nomUtilisateur),
        motDePasseUtilisateur = Value(motDePasseUtilisateur);
  static Insertable<Utilisateur> custom({
    Expression<int>? idUtilisateur,
    Expression<String>? nomUtilisateur,
    Expression<String>? motDePasseUtilisateur,
  }) {
    return RawValuesInsertable({
      if (idUtilisateur != null) 'id_utilisateur': idUtilisateur,
      if (nomUtilisateur != null) 'nom_utilisateur': nomUtilisateur,
      if (motDePasseUtilisateur != null)
        'mot_de_passe_utilisateur': motDePasseUtilisateur,
    });
  }

  UtilisateursCompanion copyWith(
      {Value<int>? idUtilisateur,
      Value<String>? nomUtilisateur,
      Value<String>? motDePasseUtilisateur}) {
    return UtilisateursCompanion(
      idUtilisateur: idUtilisateur ?? this.idUtilisateur,
      nomUtilisateur: nomUtilisateur ?? this.nomUtilisateur,
      motDePasseUtilisateur:
          motDePasseUtilisateur ?? this.motDePasseUtilisateur,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idUtilisateur.present) {
      map['id_utilisateur'] = Variable<int>(idUtilisateur.value);
    }
    if (nomUtilisateur.present) {
      map['nom_utilisateur'] = Variable<String>(nomUtilisateur.value);
    }
    if (motDePasseUtilisateur.present) {
      map['mot_de_passe_utilisateur'] =
          Variable<String>(motDePasseUtilisateur.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UtilisateursCompanion(')
          ..write('idUtilisateur: $idUtilisateur, ')
          ..write('nomUtilisateur: $nomUtilisateur, ')
          ..write('motDePasseUtilisateur: $motDePasseUtilisateur')
          ..write(')'))
        .toString();
  }
}

class $FacturesTable extends Factures with TableInfo<$FacturesTable, Facture> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FacturesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idFactureMeta =
      const VerificationMeta('idFacture');
  @override
  late final GeneratedColumn<int> idFacture = GeneratedColumn<int>(
      'id_facture', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _clientMeta = const VerificationMeta('client');
  @override
  late final GeneratedColumn<String> client = GeneratedColumn<String>(
      'client', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fournisseurMeta =
      const VerificationMeta('fournisseur');
  @override
  late final GeneratedColumn<int> fournisseur = GeneratedColumn<int>(
      'fournisseur', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES utilisateurs (id_utilisateur)'));
  static const VerificationMeta _dateFactureMeta =
      const VerificationMeta('dateFacture');
  @override
  late final GeneratedColumn<DateTime> dateFacture = GeneratedColumn<DateTime>(
      'date_facture', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idFacture, client, fournisseur, dateFacture];
  @override
  String get aliasedName => _alias ?? 'factures';
  @override
  String get actualTableName => 'factures';
  @override
  VerificationContext validateIntegrity(Insertable<Facture> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_facture')) {
      context.handle(_idFactureMeta,
          idFacture.isAcceptableOrUnknown(data['id_facture']!, _idFactureMeta));
    }
    if (data.containsKey('client')) {
      context.handle(_clientMeta,
          client.isAcceptableOrUnknown(data['client']!, _clientMeta));
    } else if (isInserting) {
      context.missing(_clientMeta);
    }
    if (data.containsKey('fournisseur')) {
      context.handle(
          _fournisseurMeta,
          fournisseur.isAcceptableOrUnknown(
              data['fournisseur']!, _fournisseurMeta));
    } else if (isInserting) {
      context.missing(_fournisseurMeta);
    }
    if (data.containsKey('date_facture')) {
      context.handle(
          _dateFactureMeta,
          dateFacture.isAcceptableOrUnknown(
              data['date_facture']!, _dateFactureMeta));
    } else if (isInserting) {
      context.missing(_dateFactureMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idFacture};
  @override
  Facture map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Facture(
      idFacture: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_facture'])!,
      client: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client'])!,
      fournisseur: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fournisseur'])!,
      dateFacture: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_facture'])!,
    );
  }

  @override
  $FacturesTable createAlias(String alias) {
    return $FacturesTable(attachedDatabase, alias);
  }
}

class Facture extends DataClass implements Insertable<Facture> {
  final int idFacture;
  final String client;
  final int fournisseur;
  final DateTime dateFacture;
  const Facture(
      {required this.idFacture,
      required this.client,
      required this.fournisseur,
      required this.dateFacture});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_facture'] = Variable<int>(idFacture);
    map['client'] = Variable<String>(client);
    map['fournisseur'] = Variable<int>(fournisseur);
    map['date_facture'] = Variable<DateTime>(dateFacture);
    return map;
  }

  FacturesCompanion toCompanion(bool nullToAbsent) {
    return FacturesCompanion(
      idFacture: Value(idFacture),
      client: Value(client),
      fournisseur: Value(fournisseur),
      dateFacture: Value(dateFacture),
    );
  }

  factory Facture.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Facture(
      idFacture: serializer.fromJson<int>(json['idFacture']),
      client: serializer.fromJson<String>(json['client']),
      fournisseur: serializer.fromJson<int>(json['fournisseur']),
      dateFacture: serializer.fromJson<DateTime>(json['dateFacture']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idFacture': serializer.toJson<int>(idFacture),
      'client': serializer.toJson<String>(client),
      'fournisseur': serializer.toJson<int>(fournisseur),
      'dateFacture': serializer.toJson<DateTime>(dateFacture),
    };
  }

  Facture copyWith(
          {int? idFacture,
          String? client,
          int? fournisseur,
          DateTime? dateFacture}) =>
      Facture(
        idFacture: idFacture ?? this.idFacture,
        client: client ?? this.client,
        fournisseur: fournisseur ?? this.fournisseur,
        dateFacture: dateFacture ?? this.dateFacture,
      );
  @override
  String toString() {
    return (StringBuffer('Facture(')
          ..write('idFacture: $idFacture, ')
          ..write('client: $client, ')
          ..write('fournisseur: $fournisseur, ')
          ..write('dateFacture: $dateFacture')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idFacture, client, fournisseur, dateFacture);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Facture &&
          other.idFacture == this.idFacture &&
          other.client == this.client &&
          other.fournisseur == this.fournisseur &&
          other.dateFacture == this.dateFacture);
}

class FacturesCompanion extends UpdateCompanion<Facture> {
  final Value<int> idFacture;
  final Value<String> client;
  final Value<int> fournisseur;
  final Value<DateTime> dateFacture;
  const FacturesCompanion({
    this.idFacture = const Value.absent(),
    this.client = const Value.absent(),
    this.fournisseur = const Value.absent(),
    this.dateFacture = const Value.absent(),
  });
  FacturesCompanion.insert({
    this.idFacture = const Value.absent(),
    required String client,
    required int fournisseur,
    required DateTime dateFacture,
  })  : client = Value(client),
        fournisseur = Value(fournisseur),
        dateFacture = Value(dateFacture);
  static Insertable<Facture> custom({
    Expression<int>? idFacture,
    Expression<String>? client,
    Expression<int>? fournisseur,
    Expression<DateTime>? dateFacture,
  }) {
    return RawValuesInsertable({
      if (idFacture != null) 'id_facture': idFacture,
      if (client != null) 'client': client,
      if (fournisseur != null) 'fournisseur': fournisseur,
      if (dateFacture != null) 'date_facture': dateFacture,
    });
  }

  FacturesCompanion copyWith(
      {Value<int>? idFacture,
      Value<String>? client,
      Value<int>? fournisseur,
      Value<DateTime>? dateFacture}) {
    return FacturesCompanion(
      idFacture: idFacture ?? this.idFacture,
      client: client ?? this.client,
      fournisseur: fournisseur ?? this.fournisseur,
      dateFacture: dateFacture ?? this.dateFacture,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idFacture.present) {
      map['id_facture'] = Variable<int>(idFacture.value);
    }
    if (client.present) {
      map['client'] = Variable<String>(client.value);
    }
    if (fournisseur.present) {
      map['fournisseur'] = Variable<int>(fournisseur.value);
    }
    if (dateFacture.present) {
      map['date_facture'] = Variable<DateTime>(dateFacture.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FacturesCompanion(')
          ..write('idFacture: $idFacture, ')
          ..write('client: $client, ')
          ..write('fournisseur: $fournisseur, ')
          ..write('dateFacture: $dateFacture')
          ..write(')'))
        .toString();
  }
}

class $OperationsTable extends Operations
    with TableInfo<$OperationsTable, Operation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OperationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idOperationMeta =
      const VerificationMeta('idOperation');
  @override
  late final GeneratedColumn<int> idOperation = GeneratedColumn<int>(
      'id_operation', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nomOperationMeta =
      const VerificationMeta('nomOperation');
  @override
  late final GeneratedColumn<String> nomOperation = GeneratedColumn<String>(
      'nom_operation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _prixOperationMeta =
      const VerificationMeta('prixOperation');
  @override
  late final GeneratedColumn<int> prixOperation = GeneratedColumn<int>(
      'prix_operation', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantiteOperationMeta =
      const VerificationMeta('quantiteOperation');
  @override
  late final GeneratedColumn<int> quantiteOperation = GeneratedColumn<int>(
      'quantite_operation', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _factureMeta =
      const VerificationMeta('facture');
  @override
  late final GeneratedColumn<int> facture = GeneratedColumn<int>(
      'facture', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES factures (id_facture)'));
  static const VerificationMeta _dateOperationMeta =
      const VerificationMeta('dateOperation');
  @override
  late final GeneratedColumn<DateTime> dateOperation =
      GeneratedColumn<DateTime>('date_operation', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        idOperation,
        nomOperation,
        prixOperation,
        quantiteOperation,
        facture,
        dateOperation
      ];
  @override
  String get aliasedName => _alias ?? 'operations';
  @override
  String get actualTableName => 'operations';
  @override
  VerificationContext validateIntegrity(Insertable<Operation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_operation')) {
      context.handle(
          _idOperationMeta,
          idOperation.isAcceptableOrUnknown(
              data['id_operation']!, _idOperationMeta));
    }
    if (data.containsKey('nom_operation')) {
      context.handle(
          _nomOperationMeta,
          nomOperation.isAcceptableOrUnknown(
              data['nom_operation']!, _nomOperationMeta));
    } else if (isInserting) {
      context.missing(_nomOperationMeta);
    }
    if (data.containsKey('prix_operation')) {
      context.handle(
          _prixOperationMeta,
          prixOperation.isAcceptableOrUnknown(
              data['prix_operation']!, _prixOperationMeta));
    } else if (isInserting) {
      context.missing(_prixOperationMeta);
    }
    if (data.containsKey('quantite_operation')) {
      context.handle(
          _quantiteOperationMeta,
          quantiteOperation.isAcceptableOrUnknown(
              data['quantite_operation']!, _quantiteOperationMeta));
    } else if (isInserting) {
      context.missing(_quantiteOperationMeta);
    }
    if (data.containsKey('facture')) {
      context.handle(_factureMeta,
          facture.isAcceptableOrUnknown(data['facture']!, _factureMeta));
    }
    if (data.containsKey('date_operation')) {
      context.handle(
          _dateOperationMeta,
          dateOperation.isAcceptableOrUnknown(
              data['date_operation']!, _dateOperationMeta));
    } else if (isInserting) {
      context.missing(_dateOperationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idOperation};
  @override
  Operation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Operation(
      idOperation: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_operation'])!,
      nomOperation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nom_operation'])!,
      prixOperation: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}prix_operation'])!,
      quantiteOperation: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}quantite_operation'])!,
      facture: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}facture']),
      dateOperation: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_operation'])!,
    );
  }

  @override
  $OperationsTable createAlias(String alias) {
    return $OperationsTable(attachedDatabase, alias);
  }
}

class Operation extends DataClass implements Insertable<Operation> {
  final int idOperation;
  final String nomOperation;
  final int prixOperation;
  final int quantiteOperation;
  final int? facture;
  final DateTime dateOperation;
  const Operation(
      {required this.idOperation,
      required this.nomOperation,
      required this.prixOperation,
      required this.quantiteOperation,
      this.facture,
      required this.dateOperation});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_operation'] = Variable<int>(idOperation);
    map['nom_operation'] = Variable<String>(nomOperation);
    map['prix_operation'] = Variable<int>(prixOperation);
    map['quantite_operation'] = Variable<int>(quantiteOperation);
    if (!nullToAbsent || facture != null) {
      map['facture'] = Variable<int>(facture);
    }
    map['date_operation'] = Variable<DateTime>(dateOperation);
    return map;
  }

  OperationsCompanion toCompanion(bool nullToAbsent) {
    return OperationsCompanion(
      idOperation: Value(idOperation),
      nomOperation: Value(nomOperation),
      prixOperation: Value(prixOperation),
      quantiteOperation: Value(quantiteOperation),
      facture: facture == null && nullToAbsent
          ? const Value.absent()
          : Value(facture),
      dateOperation: Value(dateOperation),
    );
  }

  factory Operation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Operation(
      idOperation: serializer.fromJson<int>(json['idOperation']),
      nomOperation: serializer.fromJson<String>(json['nomOperation']),
      prixOperation: serializer.fromJson<int>(json['prixOperation']),
      quantiteOperation: serializer.fromJson<int>(json['quantiteOperation']),
      facture: serializer.fromJson<int?>(json['facture']),
      dateOperation: serializer.fromJson<DateTime>(json['dateOperation']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idOperation': serializer.toJson<int>(idOperation),
      'nomOperation': serializer.toJson<String>(nomOperation),
      'prixOperation': serializer.toJson<int>(prixOperation),
      'quantiteOperation': serializer.toJson<int>(quantiteOperation),
      'facture': serializer.toJson<int?>(facture),
      'dateOperation': serializer.toJson<DateTime>(dateOperation),
    };
  }

  Operation copyWith(
          {int? idOperation,
          String? nomOperation,
          int? prixOperation,
          int? quantiteOperation,
          Value<int?> facture = const Value.absent(),
          DateTime? dateOperation}) =>
      Operation(
        idOperation: idOperation ?? this.idOperation,
        nomOperation: nomOperation ?? this.nomOperation,
        prixOperation: prixOperation ?? this.prixOperation,
        quantiteOperation: quantiteOperation ?? this.quantiteOperation,
        facture: facture.present ? facture.value : this.facture,
        dateOperation: dateOperation ?? this.dateOperation,
      );
  @override
  String toString() {
    return (StringBuffer('Operation(')
          ..write('idOperation: $idOperation, ')
          ..write('nomOperation: $nomOperation, ')
          ..write('prixOperation: $prixOperation, ')
          ..write('quantiteOperation: $quantiteOperation, ')
          ..write('facture: $facture, ')
          ..write('dateOperation: $dateOperation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idOperation, nomOperation, prixOperation,
      quantiteOperation, facture, dateOperation);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Operation &&
          other.idOperation == this.idOperation &&
          other.nomOperation == this.nomOperation &&
          other.prixOperation == this.prixOperation &&
          other.quantiteOperation == this.quantiteOperation &&
          other.facture == this.facture &&
          other.dateOperation == this.dateOperation);
}

class OperationsCompanion extends UpdateCompanion<Operation> {
  final Value<int> idOperation;
  final Value<String> nomOperation;
  final Value<int> prixOperation;
  final Value<int> quantiteOperation;
  final Value<int?> facture;
  final Value<DateTime> dateOperation;
  const OperationsCompanion({
    this.idOperation = const Value.absent(),
    this.nomOperation = const Value.absent(),
    this.prixOperation = const Value.absent(),
    this.quantiteOperation = const Value.absent(),
    this.facture = const Value.absent(),
    this.dateOperation = const Value.absent(),
  });
  OperationsCompanion.insert({
    this.idOperation = const Value.absent(),
    required String nomOperation,
    required int prixOperation,
    required int quantiteOperation,
    this.facture = const Value.absent(),
    required DateTime dateOperation,
  })  : nomOperation = Value(nomOperation),
        prixOperation = Value(prixOperation),
        quantiteOperation = Value(quantiteOperation),
        dateOperation = Value(dateOperation);
  static Insertable<Operation> custom({
    Expression<int>? idOperation,
    Expression<String>? nomOperation,
    Expression<int>? prixOperation,
    Expression<int>? quantiteOperation,
    Expression<int>? facture,
    Expression<DateTime>? dateOperation,
  }) {
    return RawValuesInsertable({
      if (idOperation != null) 'id_operation': idOperation,
      if (nomOperation != null) 'nom_operation': nomOperation,
      if (prixOperation != null) 'prix_operation': prixOperation,
      if (quantiteOperation != null) 'quantite_operation': quantiteOperation,
      if (facture != null) 'facture': facture,
      if (dateOperation != null) 'date_operation': dateOperation,
    });
  }

  OperationsCompanion copyWith(
      {Value<int>? idOperation,
      Value<String>? nomOperation,
      Value<int>? prixOperation,
      Value<int>? quantiteOperation,
      Value<int?>? facture,
      Value<DateTime>? dateOperation}) {
    return OperationsCompanion(
      idOperation: idOperation ?? this.idOperation,
      nomOperation: nomOperation ?? this.nomOperation,
      prixOperation: prixOperation ?? this.prixOperation,
      quantiteOperation: quantiteOperation ?? this.quantiteOperation,
      facture: facture ?? this.facture,
      dateOperation: dateOperation ?? this.dateOperation,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idOperation.present) {
      map['id_operation'] = Variable<int>(idOperation.value);
    }
    if (nomOperation.present) {
      map['nom_operation'] = Variable<String>(nomOperation.value);
    }
    if (prixOperation.present) {
      map['prix_operation'] = Variable<int>(prixOperation.value);
    }
    if (quantiteOperation.present) {
      map['quantite_operation'] = Variable<int>(quantiteOperation.value);
    }
    if (facture.present) {
      map['facture'] = Variable<int>(facture.value);
    }
    if (dateOperation.present) {
      map['date_operation'] = Variable<DateTime>(dateOperation.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OperationsCompanion(')
          ..write('idOperation: $idOperation, ')
          ..write('nomOperation: $nomOperation, ')
          ..write('prixOperation: $prixOperation, ')
          ..write('quantiteOperation: $quantiteOperation, ')
          ..write('facture: $facture, ')
          ..write('dateOperation: $dateOperation')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UtilisateursTable utilisateurs = $UtilisateursTable(this);
  late final $FacturesTable factures = $FacturesTable(this);
  late final $OperationsTable operations = $OperationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [utilisateurs, factures, operations];
}
