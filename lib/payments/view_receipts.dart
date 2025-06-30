import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ViewReceipts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.receipt),
      title: Text('View Receipts'),
      onTap: () {
        // Dummy view receipts logic
        Fluttertoast.showToast(
          msg: 'Viewing Receipts...',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      },
    );
  }
}