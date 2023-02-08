import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContactListItem extends StatelessWidget {
  final Function deleteItem;
  final Function updateItem;

  const ContactListItem({
    Key? key,
    required this.deleteItem,
    required this.updateItem,
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
              height: pageHeight * 0.05,
              width: pageWidth * 0.1,
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(0.7),
                  shape: BoxShape.circle),
              child: Center(
                  child: Text(
                'A',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis),
                  SizedBox(
                    height: pageHeight * 0.006,
                  ),
                  Text('Mobile Number',
                      style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            PopupMenuButton(
              elevation: 2,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text(
                    'update',
                    style: const TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.w500),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text(
                    'delete',
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
              onSelected: (value) {
                if (value == 2) {
                  updateItem();
                } else if (value == 3) {
                  deleteItem();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
