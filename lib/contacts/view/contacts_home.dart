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
          onPressed: () => _addContact(),
          child: Icon(
            Icons.dialpad,
            size: 20,
          ),
        ),
        body: Container(
          height: _height,
          width: _width,
          padding: EdgeInsets.all(8),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: ListView.builder(
                itemCount: 10,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ContactListItem(
                    deleteItem: () {},
                    updateItem: () {},
                  );
                }),
          ),
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
}
