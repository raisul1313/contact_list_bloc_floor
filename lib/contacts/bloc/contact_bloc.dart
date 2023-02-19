import 'package:contact_list/contacts/model/dto/contact.dart';
import 'package:contact_list/contacts/model/repository/contact_repository.dart';
import 'package:contact_list/stream_controler/custom_stream_controler.dart';

class ContactBloc {
  var _contactRepository = ContactRepository();
  var contactController = CustomStreamController();

  insertContactLocal(List<Contact> contact) async {
    print('Inserting contact items to Local DB');
    await _contactRepository
        .insertContact(contact)
        .then((value) =>
            print('Contact items inserted successfully. id - $value'))
        .catchError((onError) => print(
            'Contact items insertion to local DB failed.\nReason - $onError'));
  }

  getAndListenContactLocal() {
    _contactRepository.listenContactLocal().listen((contact) {
      contactController.setStream(contact);
    }).onError((handleError) =>
        print('Contact listening failed.\nReason - $handleError'));
  }

  deleteContact(Contact contact) async {
    await _contactRepository.deleteContact(contact).then(
        (value) => print('Contact item deleted successfully.'));
  }

  dispose() {
    contactController.dispose();
  }
}
