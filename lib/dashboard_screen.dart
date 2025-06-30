import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'payments/pay_with_bank.dart';
import 'payments/pos_swipe_card.dart';
import 'payments/cash_payment.dart';
import 'payments/view_receipts.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void _generateReceipt() {
    // Dummy receipt generation
    String receipt = '''
    Receipt
    -----------------
    Amount: \$100.00
    -----------------
    Thank you for your payment!
    ''';
    Fluttertoast.showToast(
      msg: receipt,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PayWithBank(onPaymentComplete: _generateReceipt),
            POSSwipeCard(onPaymentComplete: _generateReceipt),
            CashPayment(onPaymentComplete: _generateReceipt),
            ViewReceipts(),
          ],
        ),
      ),
    );
  }
}