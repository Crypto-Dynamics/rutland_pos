import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class POSSwipeCard extends StatelessWidget {
  final Function onPaymentComplete;

  POSSwipeCard({required this.onPaymentComplete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.credit_card),
      title: Text('POS Swipe Card'),
      onTap: () {
        // Dummy payment logic
        Fluttertoast.showToast(
          msg: 'Payment with POS Swipe Card Successful!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        onPaymentComplete();
      },
    );
  }
}