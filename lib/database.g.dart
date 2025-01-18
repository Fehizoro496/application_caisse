// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
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
  final DateTime dateOperation;
  const Operation(
      {required this.idOperation,
      required this.nomOperation,
      required this.prixOperation,
      required this.quantiteOperation,
      required this.dateOperation});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_operation'] = Variable<int>(idOperation);
    map['nom_operation'] = Variable<String>(nomOperation);
    map['prix_operation'] = Variable<int>(prixOperation);
    map['quantite_operation'] = Variable<int>(quantiteOperation);
    map['date_operation'] = Variable<DateTime>(dateOperation);
    return map;
  }

  OperationsCompanion toCompanion(bool nullToAbsent) {
    return OperationsCompanion(
      idOperation: Value(idOperation),
      nomOperation: Value(nomOperation),
      prixOperation: Value(prixOperation),
      quantiteOperation: Value(quantiteOperation),
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
      'dateOperation': serializer.toJson<DateTime>(dateOperation),
    };
  }

  Operation copyWith(
          {int? idOperation,
          String? nomOperation,
          int? prixOperation,
          int? quantiteOperation,
          DateTime? dateOperation}) =>
      Operation(
        idOperation: idOperation ?? this.idOperation,
        nomOperation: nomOperation ?? this.nomOperation,
        prixOperation: prixOperation ?? this.prixOperation,
        quantiteOperation: quantiteOperation ?? this.quantiteOperation,
        dateOperation: dateOperation ?? this.dateOperation,
      );
  @override
  String toString() {
    return (StringBuffer('Operation(')
          ..write('idOperation: $idOperation, ')
          ..write('nomOperation: $nomOperation, ')
          ..write('prixOperation: $prixOperation, ')
          ..write('quantiteOperation: $quantiteOperation, ')
          ..write('dateOperation: $dateOperation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idOperation, nomOperation, prixOperation,
      quantiteOperation, dateOperation);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Operation &&
          other.idOperation == this.idOperation &&
          other.nomOperation == this.nomOperation &&
          other.prixOperation == this.prixOperation &&
          other.quantiteOperation == this.quantiteOperation &&
          other.dateOperation == this.dateOperation);
}

class OperationsCompanion extends UpdateCompanion<Operation> {
  final Value<int> idOperation;
  final Value<String> nomOperation;
  final Value<int> prixOperation;
  final Value<int> quantiteOperation;
  final Value<DateTime> dateOperation;
  const OperationsCompanion({
    this.idOperation = const Value.absent(),
    this.nomOperation = const Value.absent(),
    this.prixOperation = const Value.absent(),
    this.quantiteOperation = const Value.absent(),
    this.dateOperation = const Value.absent(),
  });
  OperationsCompanion.insert({
    this.idOperation = const Value.absent(),
    required String nomOperation,
    required int prixOperation,
    required int quantiteOperation,
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
    Expression<DateTime>? dateOperation,
  }) {
    return RawValuesInsertable({
      if (idOperation != null) 'id_operation': idOperation,
      if (nomOperation != null) 'nom_operation': nomOperation,
      if (prixOperation != null) 'prix_operation': prixOperation,
      if (quantiteOperation != null) 'quantite_operation': quantiteOperation,
      if (dateOperation != null) 'date_operation': dateOperation,
    });
  }

  OperationsCompanion copyWith(
      {Value<int>? idOperation,
      Value<String>? nomOperation,
      Value<int>? prixOperation,
      Value<int>? quantiteOperation,
      Value<DateTime>? dateOperation}) {
    return OperationsCompanion(
      idOperation: idOperation ?? this.idOperation,
      nomOperation: nomOperation ?? this.nomOperation,
      prixOperation: prixOperation ?? this.prixOperation,
      quantiteOperation: quantiteOperation ?? this.quantiteOperation,
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
          ..write('dateOperation: $dateOperation')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $OperationsTable operations = $OperationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [operations];
}
