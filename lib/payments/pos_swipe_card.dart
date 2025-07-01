import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class POSSwipeCard extends StatefulWidget {
  final Function onPaymentComplete;

  POSSwipeCard({required this.onPaymentComplete});

  @override
  _POSSwipeCardState createState() => _POSSwipeCardState();
}

class _POSSwipeCardState extends State<POSSwipeCard> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.credit_card),
      title: Text('POS Swipe Card'),
      onTap: () {
        _showSwipeCardFormDialog();
      },
    );
  }

  void _showSwipeCardFormDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Swipe Card Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _cardNumberController,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  prefixIcon: Icon(Icons.credit_card),
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _expiryDateController,
                decoration: InputDecoration(
                  labelText: 'Expiry Date (MM/YY)',
                  prefixIcon: Icon(Icons.date_range),
                ),
                keyboardType: TextInputType.datetime,
              ),
              TextFormField(
                controller: _cvvController,
                decoration: InputDecoration(
                  labelText: 'CVV',
                  prefixIcon: Icon(Icons.security),
                ),
                keyboardType: TextInputType.number,
                maxLength: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_cardNumberController.text.isNotEmpty &&
                    _expiryDateController.text.isNotEmpty &&
                    _cvvController.text.isNotEmpty) {
                  Fluttertoast.showToast(
                    msg: 'Payment with POS Swipe Card Successful!',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                  );
                  widget.onPaymentComplete();
                } else {
                  Fluttertoast.showToast(
                    msg: 'Please fill in all fields!',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                  );
                }
                Navigator.of(context).pop();
              },
              child: Text('Pay'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
}