import 'package:contact_list/contacts/model/dto/contact.dart';
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
    _appDatabase = await database;

   /* final contactDao = database.contactDao;
    final contact = Contact(id: 1, name: 'Raisul', mobile: '013026998217');
    final contact1 = Contact(id: 2, name: 'Raisul', mobile: '013026998217');
    final contact2 = Contact(id: 3, name: 'Raisul', mobile: '013026998217');
    final contact3 = Contact(id: 4, name: 'Raisul', mobile: '013026998217');
    final contact4 = Contact(id: 5, name: 'Raisul', mobile: '013026998217');
    final List<Contact> contactList = [];
    contactList.add(contact);
    contactList.add(contact1);
    contactList.add(contact2);
    contactList.add(contact3);
    contactList.add(contact4);

    await contactDao.insertContact(contactList);*/
  }


  static DatabaseProvider getState() {
    _instance ??= DatabaseProvider._internal();
    return _instance!;
  }

  AppDatabase get database => _appDatabase!;
}
