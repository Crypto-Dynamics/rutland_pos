import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CashPayment extends StatelessWidget {
  final Function onPaymentComplete;

  CashPayment({required this.onPaymentComplete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.money),
      title: Text('Cash Payment'),
      onTap: () {
        // Dummy payment logic
        Fluttertoast.showToast(
          msg: 'Cash Payment Successful!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        onPaymentComplete();
      },
    );
  }
}