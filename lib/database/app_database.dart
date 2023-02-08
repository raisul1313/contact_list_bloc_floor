import 'dart:async';
import 'package:contact_list/contacts/model/dao/contact_dao.dart';
import 'package:contact_list/contacts/model/dto/contact.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';


@Database(version: 1, entities: [
  Contact
])
abstract class AppDatabase extends FloorDatabase {
  ContactDao get contactDao;
}
