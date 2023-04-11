import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class NewKhalti extends StatefulWidget {
  const NewKhalti({super.key});

  @override
  State<NewKhalti> createState() => _KhaltiPaymentState();
}

class _KhaltiPaymentState extends State<NewKhalti> {
  TextEditingController _amountController = TextEditingController();
  int amount = 0;

  // final config = PaymentConfig(
  // amount: 1000, // Amount should be in paisa
  // productIdentity: 'dell-g5-g5510-2021',
  // productName: 'Dell G5 G5510 2021',
  // productUrl: 'https://www.khalti.com/#/bazaar',
  // additionalData: {
  //   // Not mandatory; can be used for reporting purpose
  //   'vendor': 'Khalti Bazaar',
  // },
  // mobile:
  //     '9800000001', // Not mandatory; can be used to fill mobile number field
  // mobileReadOnly: true, // Not mandatory; makes the mobile field not editable
// );
  @override
  Widget build(BuildContext context) {
    _amountController.text = '800';

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _amountController,
            decoration: InputDecoration(
              hintText: 'Enter amount',
              label: Text("Amount"),
            ),
          ),
         
        ],
      ),
    );
  }
}
