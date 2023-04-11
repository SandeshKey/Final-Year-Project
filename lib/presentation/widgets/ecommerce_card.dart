import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:olivehomes/data/datas/data.dart';

import '../../core/util/colors.dart';
import '../screen/provider/khalti_new.dart';

class EcommerceCard extends StatelessWidget {
  final String? imgUrl;
  final String? name;
  final String? price;
  final String? nameFor;
  final String? madeOf;
  const EcommerceCard(
      {super.key,
      this.imgUrl,
      this.name,
      this.price,
      this.nameFor,
      this.madeOf});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 150,
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ColorUtils.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 150,
                width: 140,
                decoration: BoxDecoration(
                  color: ColorUtils.buttonRed,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name!,
                      style: const TextStyle(
                        color: ColorUtils.themeBlack,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      nameFor!,
                      style: TextStyle(
                        color: ColorUtils.themeBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      madeOf!,
                      style: TextStyle(
                        color: Color.fromARGB(255, 107, 98, 98),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            price!,
                            style: TextStyle(
                              color: ColorUtils.themeBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          KhaltiButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            config: PaymentConfig(
                              amount: int.tryParse(price! ) ?? 100,
                              productIdentity: name!,
                              productName: name!,
                            ),
                            preferences: [
                              // Not providing this will enable all the payment methods.
                              PaymentPreference.khalti,
                              PaymentPreference.eBanking,
                              PaymentPreference.connectIPS,
                            ],
                            onSuccess: (successModel) {
                              showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return AlertDialog(
                                      title: Text('Success'),
                                      content: Text('Payment successful'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  }));
                              // Navigator.push(context, route)
                              // Perform Server Verification
                            },
                            onFailure: (failureModel) {
                              showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return AlertDialog(
                                      title: Text('Failure'),
                                      content: Text('Payment failed'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  }));
                              // What to do on failure?
                            },
                            onCancel: () {
                              showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return AlertDialog(
                                      title: Text('Cancel'),
                                      content: Text('Payment cancelled'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  }));

                              // User manually cancelled the transaction
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
