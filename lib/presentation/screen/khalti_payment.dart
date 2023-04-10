import 'package:flutter/material.dart';
import 'package:khalti/khalti.dart';
import 'package:olivehomes/core/util/colors.dart';
import 'package:olivehomes/presentation/screen/home/payment.dart';

import 'home/property/property_details.dart';

class KhaltiPayment extends StatefulWidget {
  const KhaltiPayment({super.key});

  @override
  State<KhaltiPayment> createState() => _KhaltiPaymentState();
}

class _KhaltiPaymentState extends State<KhaltiPayment> {
  TextEditingController phoneController = new TextEditingController();
  TextEditingController pinCodeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                color: Colors.purple,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => PaymentScreen(),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                          color: ColorUtils.pureWhite,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(56, 0, 0, 0),
                          child: Text(
                            "Khalti for Olive Homes",
                            style: TextStyle(
                                color: ColorUtils.pureWhite,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "GO CASHLESS",
                  style: TextStyle(
                    color: ColorUtils.pureWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  "Pay online with Khalti",
                  style: TextStyle(
                    color: ColorUtils.pureWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset("assets/images/khalti_logo.png"),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                style: TextStyle(color: ColorUtils.grey),
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: ColorUtils.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 0.5, color: ColorUtils.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 0.5, color: ColorUtils.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 0.5, color: ColorUtils.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                style: TextStyle(color: ColorUtils.grey),
                controller: pinCodeController,
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Pin Code',
                  labelStyle: TextStyle(color: ColorUtils.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 0.5, color: ColorUtils.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 0.5, color: ColorUtils.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 0.5, color: ColorUtils.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.purple),
                ),
                onPressed: () async {
                  final initiationModel = await Khalti.service.initiatePayment(
                    request: PaymentInitiationRequestModel(
                      amount: 1000,
                      mobile: phoneController.text,
                      productIdentity: 'pID',
                      productName: 'Product Name',
                      transactionPin: pinCodeController.text,
                      productUrl: '',
                      additionalData: {},
                    ),
                  );

                  final otp = await showDialog(
                      context: (context),
                      barrierDismissible: false,
                      builder: (context) {
                        String? _otp;
                        return AlertDialog(
                          title: Text("Enter OTP"),
                          content: TextField(
                            onChanged: (v) => _otp = v,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              label: Text("OTP"),
                            ),
                          ),
                          actions: [
                            SimpleDialogOption(
                              child: Text("Submit"),
                              onPressed: () {
                                Navigator.pop(context, _otp);
                              },
                            ),
                          ],
                        );
                      });

                  if (otp != null) {
                    try {
                      final model = await Khalti.service.confirmPayment(
                        request: PaymentConfirmationRequestModel(
                            confirmationCode: otp,
                            token: initiationModel.token,
                            transactionPin: pinCodeController.text),
                      );

                      showDialog(
                        context: (context),
                        builder: ((context) {
                          return AlertDialog(
                            title: Text("Payment Successful"),
                            content: Text("Verification Token: ${model.token}"),
                          );
                        }),
                      );
                    } catch (e) {}
                    ;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(120, 20, 120, 20),
                  child: Text("Make Payment"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
