import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProtocolPayPage extends StatefulWidget {
  @override
  _ProtocolPayPageState createState() => _ProtocolPayPageState();
}

class _ProtocolPayPageState extends State<ProtocolPayPage> {
  final Map<String, Map<String, String>> dummyCards = {
    "4114755393849011": {"expiry": "0926", "cvv": "363", "auth": "1942", "type": "POS-101.1"},
    "4000123412341234": {"expiry": "1126", "cvv": "123", "auth": "4021", "type": "POS-101.1"},
    "4117459374038454": {"expiry": "1026", "cvv": "258", "auth": "384726", "type": "POS-101.4"},
    "4123456789012345": {"expiry": "0826", "cvv": "852", "auth": "495128", "type": "POS-101.4"},
    "5454957994741066": {"expiry": "1126", "cvv": "746", "auth": "627192", "type": "POS-101.6"},
    "5432987643987643": {"expiry": "0726", "cvv": "447", "auth": "729134", "type": "POS-101.6"},
    "6011000990131077": {"expiry": "0825", "cvv": "330", "auth": "8765", "type": "POS-101.7"},
    "6011123456789010": {"expiry": "0626", "cvv": "112", "auth": "5612", "type": "POS-101.7"},
    "3782822463101088": {"expiry": "1226", "cvv": "1059", "auth": "0000", "type": "POS-101.8"},
    "3714496353984310": {"expiry": "0326", "cvv": "3030", "auth": "0000", "type": "POS-101.8"},
    "3530760473041099": {"expiry": "0326", "cvv": "244", "auth": "712398", "type": "POS-201.1"},
    "3528000700000000": {"expiry": "0226", "cvv": "209", "auth": "888123", "type": "POS-201.1"},
    "2223000048401013": {"expiry": "0726", "cvv": "009", "auth": "939113", "type": "POS-201.3"},
    "2223000012345678": {"expiry": "0626", "cvv": "531", "auth": "112358", "type": "POS-201.3"},
    "5105937493749735": {"expiry": "0426", "cvv": "416", "auth": "558877", "type": "POS-201.5"},
    "5100123456789010": {"expiry": "0926", "cvv": "411", "auth": "123321", "type": "POS-201.5"},
  };

  final Map<String, int> protocols = {
    "POS Terminal -101.1 (4-digit approval)": 4,
    "POS Terminal -101.4 (6-digit approval)": 6,
    "POS Terminal -101.6 (Pre-authorization)": 6,
    "POS Terminal -101.7 (4-digit approval)": 4,
    "POS Terminal -101.8 (PIN-LESS transaction)": 4,
    "POS Terminal -201.1 (6-digit approval)": 6,
    "POS Terminal -201.3 (6-digit approval)": 6,
    "POS Terminal -201.5 (6-digit approval)": 6,
  };

  final Map<String, String> field39Responses = {
    "05": "Do Not Honor - Issuer Declined",
    "14": "Invalid Card Number - No Match Found",
    "54": "Expired Card - Date Mismatch",
    "82": "CVV Validation Failed",
    "91": "Issuer or Switch Inoperative",
  };

  String? selectedProtocol;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  void _submitPayment() {
    String cardNumber = cardNumberController.text;
    String expiry = expiryController.text;
    String cvv = cvvController.text;
    String amount = amountController.text;

    if (selectedProtocol == null || cardNumber.isEmpty || expiry.isEmpty || cvv.isEmpty || amount.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please fill in all fields",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return;
    }

    // Simulate payment processing
    Fluttertoast.showToast(
      msg: "Payment successful! Amount: \$amount",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );

    // Print receipt
    _printReceipt(cardNumber, expiry, cvv, amount);
  }

  void _printReceipt(String cardNumber, String expiry, String cvv, String amount) {
    String receipt = '''
    Receipt
    -----------------
    Protocol: $selectedProtocol
    Card Number: $cardNumber
    Expiry: $expiry
    CVV: $cvv
    Amount: \$$amount
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
        title: Text('Protocol Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedProtocol,
              hint: Text('Select a protocol'),
              items: protocols.keys.map((String protocol) {
                return DropdownMenuItem<String>(
                  value: protocol,
                  child: Text(protocol),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedProtocol = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: cardNumberController,
              decoration: InputDecoration(labelText: 'Card Number'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: expiryController,
              decoration: InputDecoration(labelText: 'Expiry Date (MMYY)'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: cvvController,
              decoration: InputDecoration(labelText: 'CVV'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPayment,
              child: Text('Pay'),
            ),
          ],
        ),
      ),
    );
  }
}