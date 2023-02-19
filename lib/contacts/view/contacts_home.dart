import 'package:contact_list/contacts/bloc/contact_bloc.dart';
import 'package:contact_list/contacts/model/dto/contact.dart';
import 'package:contact_list/contacts/view/contact_list_item.dart';
import 'package:contact_list/custom_ui/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ContactsHome extends StatefulWidget {
  const ContactsHome({Key? key}) : super(key: key);

  @override
  State<ContactsHome> createState() => _ContactsHomeState();
}

class _ContactsHomeState extends State<ContactsHome> {
  late double _height;
  late double _width;
  late List<Contact> _contactList;
  late ContactBloc _contactBloc;

  @override
  void initState() {
    super.initState();
    _contactList = [];
    _contactBloc = ContactBloc();
    _contactBloc.getAndListenContactLocal();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Contacts'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addContact,
          child: Icon(
            Icons.dialpad,
            size: 20,
          ),
        ),
        body: Container(
          height: _height,
          width: _width,
          padding: EdgeInsets.all(8),
          child: StreamBuilder(
              stream: _contactBloc.contactController.streamListener,
              builder: (context, snapshot) {
                _contactList =
                    snapshot.hasData ? snapshot.data as List<Contact> : [];
                return _contactList.isNotEmpty
                    ? ListView.builder(
                        itemCount: _contactList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ContactListItem(
                              deleteItem: _deleteItem,
                              updateItem: () {},
                              contact: _contactList[index]);
                        })
                    : Center(
                        child: Text(
                        'No Contact Found',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.purple),
                      ));
              }),
        ));
  }

  _addContact() {
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        clipBehavior: Clip.antiAlias,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        )),
        builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: CustomBottomSheet()));
  }

  _deleteItem(Contact contact) {
    Future.delayed(Duration.zero, () async {
      await showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(builder: (context, StateSetter setState) {
              return AlertDialog(
                title: Text(
                  "Delete Contact !",
                ),
                content: const Text(
                    "Are you sure that you want to delete this contact ?"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () async {
                      _contactBloc.deleteContact(contact);
                      Navigator.pop(context);
                    },
                    child: const Text('Yes'),
                  ),
                ],
              );
            });
          });
    });
  }
}
