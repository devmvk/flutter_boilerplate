// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database_handler.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final String name;
  final int pk;
  User({@required this.name, @required this.pk});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return User(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      pk: intType.mapFromDatabaseResponse(data['${effectivePrefix}pk']),
    );
  }
  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return User(
      name: serializer.fromJson<String>(json['name']),
      pk: serializer.fromJson<int>(json['pk']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'name': serializer.toJson<String>(name),
      'pk': serializer.toJson<int>(pk),
    };
  }

  @override
  UsersCompanion createCompanion(bool nullToAbsent) {
    return UsersCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      pk: pk == null && nullToAbsent ? const Value.absent() : Value(pk),
    );
  }

  User copyWith({String name, int pk}) => User(
        name: name ?? this.name,
        pk: pk ?? this.pk,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('name: $name, ')
          ..write('pk: $pk')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(name.hashCode, pk.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is User && other.name == this.name && other.pk == this.pk);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> name;
  final Value<int> pk;
  const UsersCompanion({
    this.name = const Value.absent(),
    this.pk = const Value.absent(),
  });
  UsersCompanion.insert({
    @required String name,
    this.pk = const Value.absent(),
  }) : name = Value(name);
  UsersCompanion copyWith({Value<String> name, Value<int> pk}) {
    return UsersCompanion(
      name: name ?? this.name,
      pk: pk ?? this.pk,
    );
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _pkMeta = const VerificationMeta('pk');
  GeneratedIntColumn _pk;
  @override
  GeneratedIntColumn get pk => _pk ??= _constructPk();
  GeneratedIntColumn _constructPk() {
    return GeneratedIntColumn('pk', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  @override
  List<GeneratedColumn> get $columns => [name, pk];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(UsersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.pk.present) {
      context.handle(_pkMeta, pk.isAcceptableValue(d.pk.value, _pkMeta));
    } else if (pk.isRequired && isInserting) {
      context.missing(_pkMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pk};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(UsersCompanion d) {
    final map = <String, Variable>{};
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.pk.present) {
      map['pk'] = Variable<int, IntType>(d.pk.value);
    }
    return map;
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

abstract class _$LocalDatabaseHandler extends GeneratedDatabase {
  _$LocalDatabaseHandler(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  @override
  List<TableInfo> get allTables => [users];
}
