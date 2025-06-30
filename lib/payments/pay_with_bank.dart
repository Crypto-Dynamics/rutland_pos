import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PayWithBank extends StatelessWidget {
  final Function onPaymentComplete;

  PayWithBank({required this.onPaymentComplete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.account_balance_wallet),
      title: Text('Pay with Bank'),
      onTap: () {
        // Dummy payment logic
        Fluttertoast.showToast(
          msg: 'Payment with Bank Successful!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        onPaymentComplete();
      },
    );
  }
}