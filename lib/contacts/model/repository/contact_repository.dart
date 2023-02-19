import 'package:contact_list/contacts/model/dao/contact_dao.dart';
import 'package:contact_list/contacts/model/dto/contact.dart';
import 'package:contact_list/database/database_provider.dart';

class ContactRepository {
  final _contactDio = DatabaseProvider
      .getState()
      .database
      .contactDao;

  Future<List<int>> insertContact(List<Contact> contact) =>
      _contactDio.insertContact(contact);

  //Future<void> updateContact(contact) => _contactDio.updateContact(contact);

  Future<void> deleteContact(contact) => _contactDio.deleteContact(contact);

  Stream<List<Contact>> listenContactLocal() => _contactDio.listenContact();
}
