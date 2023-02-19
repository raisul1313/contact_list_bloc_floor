import 'package:contact_list/database/app_database.dart';

class DatabaseProvider {
  static DatabaseProvider? _instance;

  AppDatabase? _appDatabase;

  DatabaseProvider();

  DatabaseProvider._internal() {
    _initDb();
  }

  Future<void> _initDb() async {
    // method
    await _createDb();
  }

  _createDb() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('contact.db').build();
    _appDatabase = database;
  }

  static DatabaseProvider getState() {
    _instance ??= DatabaseProvider._internal();
    return _instance!;
  }

  AppDatabase get database => _appDatabase!;
}
