import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _formKey = GlobalKey<FormState>();
  String _cardNumber = '';
  String _expiryDate = '';
  String _cvc = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Fluttertoast.showToast(
        msg: 'Payment Successful!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      _generateReceipt();
    }
  }

  void _generateReceipt() {
    // Dummy receipt generation
    String receipt = '''
    Receipt
    -----------------
    Card Number: $_cardNumber
    Expiry Date: $_expiryDate
    CVC: $_cvc
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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Card Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your card number';
                  }
                  return null;
                },
                onSaved: (value) => _cardNumber = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Expiry Date (MM/YY)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the expiry date';
                  }
                  return null;
                },
                onSaved: (value) => _expiryDate = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'CVC'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the CVC';
                  }
                  return null;
                },
                onSaved: (value) => _cvc = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Process Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}