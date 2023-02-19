import 'package:contact_list/contacts/model/dto/contact.dart';
import 'package:floor/floor.dart';

@dao
abstract class ContactDao {
  //Insert contact into list
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertContact(List<Contact> contactList);

  @Query('SELECT * FROM Contact')
  Stream<List<Contact>> listenContact();

  //Update a contact from list
 /* @update
  Future<void> updateContact(Contact contact);*/

  //Update a contact from list
  @delete
  Future<void> deleteContact(Contact contact);
}
