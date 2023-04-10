import 'package:olivehomes/core/util/colors.dart';
import 'package:olivehomes/presentation/screen/home/property/property_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () => PropertyDetails(),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: ColorUtils.pureWhite,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(56, 0, 0, 0),
                  child: Text(
                    "Payment Merchants",
                    style: TextStyle(
                      fontSize: 24,
                      color: ColorUtils.pureWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
            child: Divider(
              color: ColorUtils.grey,
              height: .1,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: Text(
                    "Select a payment method to proceed.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorUtils.pureWhite,
                      fontSize: 16,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 2,
                  color: ColorUtils.buttonRed,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pay via Khalti",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: ColorUtils.pureWhite,
                          ),
                        ),
                        Image.asset(
                          "assets/images/Khalti.png",
                          height: 48,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 2,
                  color: ColorUtils.buttonRed,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pay via eSewa",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: ColorUtils.pureWhite,
                          ),
                        ),
                        Image.asset(
                          "assets/images/eSewa.png",
                          height: 48,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 2,
                  color: ColorUtils.buttonRed,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pay via FonePay",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: ColorUtils.pureWhite,
                          ),
                        ),
                        Image.asset(
                          "assets/images/fonepay.png",
                          height: 48,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.all(24.0),
            child: Divider(
              thickness: .5,
              color: ColorUtils.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 2,
                  color: ColorUtils.buttonRed,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Request Bank Information",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: ColorUtils.pureWhite,
                          ),
                        ),
                        Icon(
                          Icons.message_rounded,
                          color: ColorUtils.buttonRed,
                          size: 32,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
