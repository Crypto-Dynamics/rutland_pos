import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PayWithBank extends StatefulWidget {
  final Function onPaymentComplete;

  PayWithBank({required this.onPaymentComplete});

  @override
  _PayWithBankState createState() => _PayWithBankState();
}

class _PayWithBankState extends State<PayWithBank> {
  String? selectedBank;

  List<String> banks = [
    'Bank of America',
    'Chase',
    'Wells Fargo',
    'Citibank',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.credit_card),
      title: Text('Pay with Bank'),
      onTap: () {
        _showBankSelectionDialog();
      },
    );
  }

  void _showBankSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Bank'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                child: DropdownButtonFormField<String>(
                  value: selectedBank,
                  items: banks.map((bank) {
                    return DropdownMenuItem<String>(
                      value: bank,
                      child: Text(bank),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedBank = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Select Bank',
                  ),
                ),
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
                if (selectedBank != null) {
                  Fluttertoast.showToast(
                    msg: 'Payment with $selectedBank Successful!',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                  );
                  widget.onPaymentComplete();
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
}