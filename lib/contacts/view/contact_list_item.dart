import 'package:contact_list/contacts/model/dto/contact.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContactListItem extends StatelessWidget {
  final Function deleteItem;
  final Function updateItem;
  final Contact contact;

  const ContactListItem({
    Key? key,
    required this.deleteItem,
    required this.updateItem,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    double pageWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: pageHeight * 0.07,
              width: pageWidth * 0.14,
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(0.7),
                  shape: BoxShape.circle),
              child: Center(
                  child: Text(
                contact.name![0].toUpperCase(),
                style: TextStyle(fontSize: 25, color: Colors.white),
              )),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      contact.name![0].toUpperCase() +
                          contact.name!.substring(1),
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis),
                  SizedBox(
                    height: pageHeight * 0.006,
                  ),
                  Text('0${contact.mobile!}',
                      style: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("Update"),
                        value: 1,
                        onTap: () => updateItem(contact),
                      ),
                      PopupMenuItem(
                        child: Text("Delete"),
                        value: 2,
                        onTap: () => deleteItem(contact),
                      )
                    ]),
          ],
        ),
      ),
    );
  }
}
