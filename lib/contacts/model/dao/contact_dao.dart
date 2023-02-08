import 'package:contact_list/contacts/model/dto/contact.dart';
import 'package:floor/floor.dart';

@dao
abstract class ContactDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertContact(List<Contact> contact);

  @Query('SELECT * FROM Contact')
  Stream<List<Contact>> listenContact();

}
