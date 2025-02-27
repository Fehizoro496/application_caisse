// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
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
  static const VerificationMeta _dateFactureMeta =
      const VerificationMeta('dateFacture');
  @override
  late final GeneratedColumn<DateTime> dateFacture = GeneratedColumn<DateTime>(
      'date_facture', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [idFacture, client, dateFacture];
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
  final DateTime dateFacture;
  const Facture(
      {required this.idFacture,
      required this.client,
      required this.dateFacture});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_facture'] = Variable<int>(idFacture);
    map['client'] = Variable<String>(client);
    map['date_facture'] = Variable<DateTime>(dateFacture);
    return map;
  }

  FacturesCompanion toCompanion(bool nullToAbsent) {
    return FacturesCompanion(
      idFacture: Value(idFacture),
      client: Value(client),
      dateFacture: Value(dateFacture),
    );
  }

  factory Facture.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Facture(
      idFacture: serializer.fromJson<int>(json['idFacture']),
      client: serializer.fromJson<String>(json['client']),
      dateFacture: serializer.fromJson<DateTime>(json['dateFacture']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idFacture': serializer.toJson<int>(idFacture),
      'client': serializer.toJson<String>(client),
      'dateFacture': serializer.toJson<DateTime>(dateFacture),
    };
  }

  Facture copyWith({int? idFacture, String? client, DateTime? dateFacture}) =>
      Facture(
        idFacture: idFacture ?? this.idFacture,
        client: client ?? this.client,
        dateFacture: dateFacture ?? this.dateFacture,
      );
  @override
  String toString() {
    return (StringBuffer('Facture(')
          ..write('idFacture: $idFacture, ')
          ..write('client: $client, ')
          ..write('dateFacture: $dateFacture')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idFacture, client, dateFacture);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Facture &&
          other.idFacture == this.idFacture &&
          other.client == this.client &&
          other.dateFacture == this.dateFacture);
}

class FacturesCompanion extends UpdateCompanion<Facture> {
  final Value<int> idFacture;
  final Value<String> client;
  final Value<DateTime> dateFacture;
  const FacturesCompanion({
    this.idFacture = const Value.absent(),
    this.client = const Value.absent(),
    this.dateFacture = const Value.absent(),
  });
  FacturesCompanion.insert({
    this.idFacture = const Value.absent(),
    required String client,
    required DateTime dateFacture,
  })  : client = Value(client),
        dateFacture = Value(dateFacture);
  static Insertable<Facture> custom({
    Expression<int>? idFacture,
    Expression<String>? client,
    Expression<DateTime>? dateFacture,
  }) {
    return RawValuesInsertable({
      if (idFacture != null) 'id_facture': idFacture,
      if (client != null) 'client': client,
      if (dateFacture != null) 'date_facture': dateFacture,
    });
  }

  FacturesCompanion copyWith(
      {Value<int>? idFacture,
      Value<String>? client,
      Value<DateTime>? dateFacture}) {
    return FacturesCompanion(
      idFacture: idFacture ?? this.idFacture,
      client: client ?? this.client,
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

class $DepensesTable extends Depenses with TableInfo<$DepensesTable, Depense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DepensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idDepenseMeta =
      const VerificationMeta('idDepense');
  @override
  late final GeneratedColumn<int> idDepense = GeneratedColumn<int>(
      'id_depense', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _libelleMeta =
      const VerificationMeta('libelle');
  @override
  late final GeneratedColumn<String> libelle = GeneratedColumn<String>(
      'libelle', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _montantMeta =
      const VerificationMeta('montant');
  @override
  late final GeneratedColumn<int> montant = GeneratedColumn<int>(
      'montant', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateDepenseMeta =
      const VerificationMeta('dateDepense');
  @override
  late final GeneratedColumn<DateTime> dateDepense = GeneratedColumn<DateTime>(
      'date_depense', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idDepense, libelle, montant, dateDepense];
  @override
  String get aliasedName => _alias ?? 'depenses';
  @override
  String get actualTableName => 'depenses';
  @override
  VerificationContext validateIntegrity(Insertable<Depense> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_depense')) {
      context.handle(_idDepenseMeta,
          idDepense.isAcceptableOrUnknown(data['id_depense']!, _idDepenseMeta));
    }
    if (data.containsKey('libelle')) {
      context.handle(_libelleMeta,
          libelle.isAcceptableOrUnknown(data['libelle']!, _libelleMeta));
    } else if (isInserting) {
      context.missing(_libelleMeta);
    }
    if (data.containsKey('montant')) {
      context.handle(_montantMeta,
          montant.isAcceptableOrUnknown(data['montant']!, _montantMeta));
    } else if (isInserting) {
      context.missing(_montantMeta);
    }
    if (data.containsKey('date_depense')) {
      context.handle(
          _dateDepenseMeta,
          dateDepense.isAcceptableOrUnknown(
              data['date_depense']!, _dateDepenseMeta));
    } else if (isInserting) {
      context.missing(_dateDepenseMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idDepense};
  @override
  Depense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Depense(
      idDepense: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_depense'])!,
      libelle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}libelle'])!,
      montant: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}montant'])!,
      dateDepense: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_depense'])!,
    );
  }

  @override
  $DepensesTable createAlias(String alias) {
    return $DepensesTable(attachedDatabase, alias);
  }
}

class Depense extends DataClass implements Insertable<Depense> {
  final int idDepense;
  final String libelle;
  final int montant;
  final DateTime dateDepense;
  const Depense(
      {required this.idDepense,
      required this.libelle,
      required this.montant,
      required this.dateDepense});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_depense'] = Variable<int>(idDepense);
    map['libelle'] = Variable<String>(libelle);
    map['montant'] = Variable<int>(montant);
    map['date_depense'] = Variable<DateTime>(dateDepense);
    return map;
  }

  DepensesCompanion toCompanion(bool nullToAbsent) {
    return DepensesCompanion(
      idDepense: Value(idDepense),
      libelle: Value(libelle),
      montant: Value(montant),
      dateDepense: Value(dateDepense),
    );
  }

  factory Depense.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Depense(
      idDepense: serializer.fromJson<int>(json['idDepense']),
      libelle: serializer.fromJson<String>(json['libelle']),
      montant: serializer.fromJson<int>(json['montant']),
      dateDepense: serializer.fromJson<DateTime>(json['dateDepense']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idDepense': serializer.toJson<int>(idDepense),
      'libelle': serializer.toJson<String>(libelle),
      'montant': serializer.toJson<int>(montant),
      'dateDepense': serializer.toJson<DateTime>(dateDepense),
    };
  }

  Depense copyWith(
          {int? idDepense,
          String? libelle,
          int? montant,
          DateTime? dateDepense}) =>
      Depense(
        idDepense: idDepense ?? this.idDepense,
        libelle: libelle ?? this.libelle,
        montant: montant ?? this.montant,
        dateDepense: dateDepense ?? this.dateDepense,
      );
  @override
  String toString() {
    return (StringBuffer('Depense(')
          ..write('idDepense: $idDepense, ')
          ..write('libelle: $libelle, ')
          ..write('montant: $montant, ')
          ..write('dateDepense: $dateDepense')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idDepense, libelle, montant, dateDepense);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Depense &&
          other.idDepense == this.idDepense &&
          other.libelle == this.libelle &&
          other.montant == this.montant &&
          other.dateDepense == this.dateDepense);
}

class DepensesCompanion extends UpdateCompanion<Depense> {
  final Value<int> idDepense;
  final Value<String> libelle;
  final Value<int> montant;
  final Value<DateTime> dateDepense;
  const DepensesCompanion({
    this.idDepense = const Value.absent(),
    this.libelle = const Value.absent(),
    this.montant = const Value.absent(),
    this.dateDepense = const Value.absent(),
  });
  DepensesCompanion.insert({
    this.idDepense = const Value.absent(),
    required String libelle,
    required int montant,
    required DateTime dateDepense,
  })  : libelle = Value(libelle),
        montant = Value(montant),
        dateDepense = Value(dateDepense);
  static Insertable<Depense> custom({
    Expression<int>? idDepense,
    Expression<String>? libelle,
    Expression<int>? montant,
    Expression<DateTime>? dateDepense,
  }) {
    return RawValuesInsertable({
      if (idDepense != null) 'id_depense': idDepense,
      if (libelle != null) 'libelle': libelle,
      if (montant != null) 'montant': montant,
      if (dateDepense != null) 'date_depense': dateDepense,
    });
  }

  DepensesCompanion copyWith(
      {Value<int>? idDepense,
      Value<String>? libelle,
      Value<int>? montant,
      Value<DateTime>? dateDepense}) {
    return DepensesCompanion(
      idDepense: idDepense ?? this.idDepense,
      libelle: libelle ?? this.libelle,
      montant: montant ?? this.montant,
      dateDepense: dateDepense ?? this.dateDepense,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idDepense.present) {
      map['id_depense'] = Variable<int>(idDepense.value);
    }
    if (libelle.present) {
      map['libelle'] = Variable<String>(libelle.value);
    }
    if (montant.present) {
      map['montant'] = Variable<int>(montant.value);
    }
    if (dateDepense.present) {
      map['date_depense'] = Variable<DateTime>(dateDepense.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DepensesCompanion(')
          ..write('idDepense: $idDepense, ')
          ..write('libelle: $libelle, ')
          ..write('montant: $montant, ')
          ..write('dateDepense: $dateDepense')
          ..write(')'))
        .toString();
  }
}

class $PrelevementsTable extends Prelevements
    with TableInfo<$PrelevementsTable, Prelevement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrelevementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idPrelevementMeta =
      const VerificationMeta('idPrelevement');
  @override
  late final GeneratedColumn<int> idPrelevement = GeneratedColumn<int>(
      'id_prelevement', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _montantMeta =
      const VerificationMeta('montant');
  @override
  late final GeneratedColumn<int> montant = GeneratedColumn<int>(
      'montant', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _datePrelevementMeta =
      const VerificationMeta('datePrelevement');
  @override
  late final GeneratedColumn<DateTime> datePrelevement =
      GeneratedColumn<DateTime>('date_prelevement', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idPrelevement, montant, datePrelevement];
  @override
  String get aliasedName => _alias ?? 'prelevements';
  @override
  String get actualTableName => 'prelevements';
  @override
  VerificationContext validateIntegrity(Insertable<Prelevement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_prelevement')) {
      context.handle(
          _idPrelevementMeta,
          idPrelevement.isAcceptableOrUnknown(
              data['id_prelevement']!, _idPrelevementMeta));
    }
    if (data.containsKey('montant')) {
      context.handle(_montantMeta,
          montant.isAcceptableOrUnknown(data['montant']!, _montantMeta));
    } else if (isInserting) {
      context.missing(_montantMeta);
    }
    if (data.containsKey('date_prelevement')) {
      context.handle(
          _datePrelevementMeta,
          datePrelevement.isAcceptableOrUnknown(
              data['date_prelevement']!, _datePrelevementMeta));
    } else if (isInserting) {
      context.missing(_datePrelevementMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPrelevement};
  @override
  Prelevement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Prelevement(
      idPrelevement: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_prelevement'])!,
      montant: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}montant'])!,
      datePrelevement: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_prelevement'])!,
    );
  }

  @override
  $PrelevementsTable createAlias(String alias) {
    return $PrelevementsTable(attachedDatabase, alias);
  }
}

class Prelevement extends DataClass implements Insertable<Prelevement> {
  final int idPrelevement;
  final int montant;
  final DateTime datePrelevement;
  const Prelevement(
      {required this.idPrelevement,
      required this.montant,
      required this.datePrelevement});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_prelevement'] = Variable<int>(idPrelevement);
    map['montant'] = Variable<int>(montant);
    map['date_prelevement'] = Variable<DateTime>(datePrelevement);
    return map;
  }

  PrelevementsCompanion toCompanion(bool nullToAbsent) {
    return PrelevementsCompanion(
      idPrelevement: Value(idPrelevement),
      montant: Value(montant),
      datePrelevement: Value(datePrelevement),
    );
  }

  factory Prelevement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Prelevement(
      idPrelevement: serializer.fromJson<int>(json['idPrelevement']),
      montant: serializer.fromJson<int>(json['montant']),
      datePrelevement: serializer.fromJson<DateTime>(json['datePrelevement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPrelevement': serializer.toJson<int>(idPrelevement),
      'montant': serializer.toJson<int>(montant),
      'datePrelevement': serializer.toJson<DateTime>(datePrelevement),
    };
  }

  Prelevement copyWith(
          {int? idPrelevement, int? montant, DateTime? datePrelevement}) =>
      Prelevement(
        idPrelevement: idPrelevement ?? this.idPrelevement,
        montant: montant ?? this.montant,
        datePrelevement: datePrelevement ?? this.datePrelevement,
      );
  @override
  String toString() {
    return (StringBuffer('Prelevement(')
          ..write('idPrelevement: $idPrelevement, ')
          ..write('montant: $montant, ')
          ..write('datePrelevement: $datePrelevement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idPrelevement, montant, datePrelevement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Prelevement &&
          other.idPrelevement == this.idPrelevement &&
          other.montant == this.montant &&
          other.datePrelevement == this.datePrelevement);
}

class PrelevementsCompanion extends UpdateCompanion<Prelevement> {
  final Value<int> idPrelevement;
  final Value<int> montant;
  final Value<DateTime> datePrelevement;
  const PrelevementsCompanion({
    this.idPrelevement = const Value.absent(),
    this.montant = const Value.absent(),
    this.datePrelevement = const Value.absent(),
  });
  PrelevementsCompanion.insert({
    this.idPrelevement = const Value.absent(),
    required int montant,
    required DateTime datePrelevement,
  })  : montant = Value(montant),
        datePrelevement = Value(datePrelevement);
  static Insertable<Prelevement> custom({
    Expression<int>? idPrelevement,
    Expression<int>? montant,
    Expression<DateTime>? datePrelevement,
  }) {
    return RawValuesInsertable({
      if (idPrelevement != null) 'id_prelevement': idPrelevement,
      if (montant != null) 'montant': montant,
      if (datePrelevement != null) 'date_prelevement': datePrelevement,
    });
  }

  PrelevementsCompanion copyWith(
      {Value<int>? idPrelevement,
      Value<int>? montant,
      Value<DateTime>? datePrelevement}) {
    return PrelevementsCompanion(
      idPrelevement: idPrelevement ?? this.idPrelevement,
      montant: montant ?? this.montant,
      datePrelevement: datePrelevement ?? this.datePrelevement,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPrelevement.present) {
      map['id_prelevement'] = Variable<int>(idPrelevement.value);
    }
    if (montant.present) {
      map['montant'] = Variable<int>(montant.value);
    }
    if (datePrelevement.present) {
      map['date_prelevement'] = Variable<DateTime>(datePrelevement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrelevementsCompanion(')
          ..write('idPrelevement: $idPrelevement, ')
          ..write('montant: $montant, ')
          ..write('datePrelevement: $datePrelevement')
          ..write(')'))
        .toString();
  }
}

class $RelevesTable extends Releves with TableInfo<$RelevesTable, Releve> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelevesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idReleveMeta =
      const VerificationMeta('idReleve');
  @override
  late final GeneratedColumn<int> idReleve = GeneratedColumn<int>(
      'id_releve', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _compteurMeta =
      const VerificationMeta('compteur');
  @override
  late final GeneratedColumn<double> compteur = GeneratedColumn<double>(
      'compteur', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _sousCompteurMeta =
      const VerificationMeta('sousCompteur');
  @override
  late final GeneratedColumn<double> sousCompteur = GeneratedColumn<double>(
      'sous_compteur', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dateReleveMeta =
      const VerificationMeta('dateReleve');
  @override
  late final GeneratedColumn<DateTime> dateReleve = GeneratedColumn<DateTime>(
      'date_releve', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idReleve, compteur, sousCompteur, dateReleve];
  @override
  String get aliasedName => _alias ?? 'releves';
  @override
  String get actualTableName => 'releves';
  @override
  VerificationContext validateIntegrity(Insertable<Releve> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_releve')) {
      context.handle(_idReleveMeta,
          idReleve.isAcceptableOrUnknown(data['id_releve']!, _idReleveMeta));
    }
    if (data.containsKey('compteur')) {
      context.handle(_compteurMeta,
          compteur.isAcceptableOrUnknown(data['compteur']!, _compteurMeta));
    } else if (isInserting) {
      context.missing(_compteurMeta);
    }
    if (data.containsKey('sous_compteur')) {
      context.handle(
          _sousCompteurMeta,
          sousCompteur.isAcceptableOrUnknown(
              data['sous_compteur']!, _sousCompteurMeta));
    } else if (isInserting) {
      context.missing(_sousCompteurMeta);
    }
    if (data.containsKey('date_releve')) {
      context.handle(
          _dateReleveMeta,
          dateReleve.isAcceptableOrUnknown(
              data['date_releve']!, _dateReleveMeta));
    } else if (isInserting) {
      context.missing(_dateReleveMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idReleve};
  @override
  Releve map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Releve(
      idReleve: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_releve'])!,
      compteur: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}compteur'])!,
      sousCompteur: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sous_compteur'])!,
      dateReleve: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_releve'])!,
    );
  }

  @override
  $RelevesTable createAlias(String alias) {
    return $RelevesTable(attachedDatabase, alias);
  }
}

class Releve extends DataClass implements Insertable<Releve> {
  final int idReleve;
  final double compteur;
  final double sousCompteur;
  final DateTime dateReleve;
  const Releve(
      {required this.idReleve,
      required this.compteur,
      required this.sousCompteur,
      required this.dateReleve});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_releve'] = Variable<int>(idReleve);
    map['compteur'] = Variable<double>(compteur);
    map['sous_compteur'] = Variable<double>(sousCompteur);
    map['date_releve'] = Variable<DateTime>(dateReleve);
    return map;
  }

  RelevesCompanion toCompanion(bool nullToAbsent) {
    return RelevesCompanion(
      idReleve: Value(idReleve),
      compteur: Value(compteur),
      sousCompteur: Value(sousCompteur),
      dateReleve: Value(dateReleve),
    );
  }

  factory Releve.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Releve(
      idReleve: serializer.fromJson<int>(json['idReleve']),
      compteur: serializer.fromJson<double>(json['compteur']),
      sousCompteur: serializer.fromJson<double>(json['sousCompteur']),
      dateReleve: serializer.fromJson<DateTime>(json['dateReleve']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idReleve': serializer.toJson<int>(idReleve),
      'compteur': serializer.toJson<double>(compteur),
      'sousCompteur': serializer.toJson<double>(sousCompteur),
      'dateReleve': serializer.toJson<DateTime>(dateReleve),
    };
  }

  Releve copyWith(
          {int? idReleve,
          double? compteur,
          double? sousCompteur,
          DateTime? dateReleve}) =>
      Releve(
        idReleve: idReleve ?? this.idReleve,
        compteur: compteur ?? this.compteur,
        sousCompteur: sousCompteur ?? this.sousCompteur,
        dateReleve: dateReleve ?? this.dateReleve,
      );
  @override
  String toString() {
    return (StringBuffer('Releve(')
          ..write('idReleve: $idReleve, ')
          ..write('compteur: $compteur, ')
          ..write('sousCompteur: $sousCompteur, ')
          ..write('dateReleve: $dateReleve')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idReleve, compteur, sousCompteur, dateReleve);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Releve &&
          other.idReleve == this.idReleve &&
          other.compteur == this.compteur &&
          other.sousCompteur == this.sousCompteur &&
          other.dateReleve == this.dateReleve);
}

class RelevesCompanion extends UpdateCompanion<Releve> {
  final Value<int> idReleve;
  final Value<double> compteur;
  final Value<double> sousCompteur;
  final Value<DateTime> dateReleve;
  const RelevesCompanion({
    this.idReleve = const Value.absent(),
    this.compteur = const Value.absent(),
    this.sousCompteur = const Value.absent(),
    this.dateReleve = const Value.absent(),
  });
  RelevesCompanion.insert({
    this.idReleve = const Value.absent(),
    required double compteur,
    required double sousCompteur,
    required DateTime dateReleve,
  })  : compteur = Value(compteur),
        sousCompteur = Value(sousCompteur),
        dateReleve = Value(dateReleve);
  static Insertable<Releve> custom({
    Expression<int>? idReleve,
    Expression<double>? compteur,
    Expression<double>? sousCompteur,
    Expression<DateTime>? dateReleve,
  }) {
    return RawValuesInsertable({
      if (idReleve != null) 'id_releve': idReleve,
      if (compteur != null) 'compteur': compteur,
      if (sousCompteur != null) 'sous_compteur': sousCompteur,
      if (dateReleve != null) 'date_releve': dateReleve,
    });
  }

  RelevesCompanion copyWith(
      {Value<int>? idReleve,
      Value<double>? compteur,
      Value<double>? sousCompteur,
      Value<DateTime>? dateReleve}) {
    return RelevesCompanion(
      idReleve: idReleve ?? this.idReleve,
      compteur: compteur ?? this.compteur,
      sousCompteur: sousCompteur ?? this.sousCompteur,
      dateReleve: dateReleve ?? this.dateReleve,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idReleve.present) {
      map['id_releve'] = Variable<int>(idReleve.value);
    }
    if (compteur.present) {
      map['compteur'] = Variable<double>(compteur.value);
    }
    if (sousCompteur.present) {
      map['sous_compteur'] = Variable<double>(sousCompteur.value);
    }
    if (dateReleve.present) {
      map['date_releve'] = Variable<DateTime>(dateReleve.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelevesCompanion(')
          ..write('idReleve: $idReleve, ')
          ..write('compteur: $compteur, ')
          ..write('sousCompteur: $sousCompteur, ')
          ..write('dateReleve: $dateReleve')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $FacturesTable factures = $FacturesTable(this);
  late final $OperationsTable operations = $OperationsTable(this);
  late final $DepensesTable depenses = $DepensesTable(this);
  late final $PrelevementsTable prelevements = $PrelevementsTable(this);
  late final $RelevesTable releves = $RelevesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [factures, operations, depenses, prelevements, releves];
}
