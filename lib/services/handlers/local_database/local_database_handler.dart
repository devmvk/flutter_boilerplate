import 'package:moor_flutter/moor_flutter.dart';

part 'local_database_handler.g.dart';

@UseMoor(tables: [Users])
class LocalDatabaseHandler extends _$LocalDatabaseHandler {
  
  LocalDatabaseHandler():super((FlutterQueryExecutor.inDatabaseFolder(path: 'app-db.sqlite', logStatements: true)));

  @override
  int get schemaVersion => 1;
}

class Users extends Table{
  TextColumn get name => text().withLength(min: 1)();
  IntColumn get pk => integer().autoIncrement()();
}