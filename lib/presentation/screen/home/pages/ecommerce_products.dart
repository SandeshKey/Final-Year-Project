import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:olivehomes/core/util/colors.dart';
import 'package:olivehomes/presentation/screen/home/payment.dart';
import 'package:olivehomes/presentation/screen/khalti_payment.dart';
import 'package:olivehomes/presentation/screen/provider/khalti_new.dart';
import 'package:olivehomes/presentation/widgets/ecommerce_card.dart';

class EcommerceProducts extends StatelessWidget {
  const EcommerceProducts({super.key});

  @override
  Widget build(BuildContext context) {

    //TODO change data here
    final List ecommerceData = [
      {
        'img':
            "https://cdn.pixabay.com/photo/2022/02/05/20/13/tulips-6995691__480.jpg",
        'title': "Relaxing Chair",
        'price': 500,
        'for': "For Homes and Hotels",
        'madeOf': "Ceramics and Clay"
      },
      {
        'img':
            "https://cdn.pixabay.com/photo/2022/02/05/20/13/tulips-6995691__480.jpg",
        'title': "Flower Vase",
        'price': 500,
        'for': "For Homes and Hotels",
        'madeOf': "Ceramics and Clay"
      },
      {
        'img':
            "https://cdn.pixabay.com/photo/2022/02/05/20/13/tulips-6995691__480.jpg",
        'title': "Relaxing Chair",
        'price': 500,
        'for': "For Homes and Hotels",
        'madeOf': "Ceramics and Clay"
      },
      {
        'img':
            "https://cdn.pixabay.com/photo/2016/11/19/17/25/furniture-1840463__480.jpg",
        'title': "Relaxing Chair",
        'price': 500,
        'for': "For Homes and Hotels",
        'madeOf': "Ceramics and Clay"
      },
      {
        'img':
            "https://cdn.pixabay.com/photo/2022/02/05/20/13/tulips-6995691__480.jpg",
        'title': "Relaxing Chair",
        'price': 500,
        'for': "For Homes and Hotels",
        'madeOf': "Ceramics and Clay"
      },
      {
        'img':
            "https://cdn.pixabay.com/photo/2022/02/05/20/13/tulips-6995691__480.jpg",
        'title': "Relaxing Chair",
        'price': 500,
        'for': "For Homes and Hotels",
        'madeOf': "Ceramics and Clay"
      },
      {
        'img':
            "https://cdn.pixabay.com/photo/2022/02/05/20/13/tulips-6995691__480.jpg",
        'title': "Relaxing Chair",
        'price': 500,
        'for': "For Homes and Hotels",
        'madeOf': "Ceramics and Clay"
      },
      {
        'img':
            "https://cdn.pixabay.com/photo/2022/02/05/20/13/tulips-6995691__480.jpg",
        'title': "Relaxing Chair",
        'price': 500,
        'for': "For Homes and Hotels",
        'madeOf': "Ceramics and Clay"
      }
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: ColorUtils.buttonRed,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 16, 16, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: ColorUtils.pureWhite,
                              // color: ColorUtils.buttonRed,
                              size: 24,
                            ),
                          ),
                          const Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: Text(
                              "Decorate your Home",
                              style: TextStyle(
                                color: ColorUtils.pureWhite,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: List.generate(
                  ecommerceData.length,
                  (index) => EcommerceCard(
                    imgUrl: ecommerceData[index]['img'],
                    name: ecommerceData[index]['title'],
                    price: ecommerceData[index]['price'].toString(),
                    nameFor: ecommerceData[index]['for'],
                    madeOf: ecommerceData[index]['madeOf'],
                  ),
                ),
              ),

              // Expanded(child: ListView.builder(itemBuilder: (context, index) {
              // return
              // EcommerceCard(
              //   imgUrl: ecommerceData[0]['img'],
              //   name: ecommerceData[0]['title'],
              //   price: ecommerceData[0]['price'].toString(),
              //   nameFor: ecommerceData[0]['for'],
              //   madeOf: ecommerceData[0]['madeOf'],
              // ),

              // })),
              // Padding(
              //   padding: const EdgeInsets.all(12.0),
              //   child: Container(
              //     height: 150,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       color: ColorUtils.grey,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Row(
              //       children: [
              //         Container(
              //           height: 150,
              //           width: 150,
              //           decoration: BoxDecoration(
              //             color: ColorUtils.buttonRed,
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Image.network(
              //             "https://cdn.pixabay.com/photo/2014/09/15/21/46/couch-447484__480.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(12.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 "Relaxing Chair",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w800,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "For Home, and Hotels",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "Fabrics, Polyster",
              //                 style: TextStyle(
              //                   color: Color.fromARGB(255, 107, 98, 98),
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w400,
              //                 ),
              //               ),
              //               Container(
              //                 width: 200,
              //                 child: Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       "Rs. 3,900",
              //                       style: TextStyle(
              //                         color: ColorUtils.themeBlack,
              //                         fontSize: 18,
              //                         fontWeight: FontWeight.w700,
              //                       ),
              //                     ),
              //                     GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                             builder: (context) => NewKhalti(),
              //                           ),
              //                         );
              //                       },
              //                       child: Container(
              //                         height: 40,
              //                         width: 80,
              //                         decoration: BoxDecoration(
              //                           color: ColorUtils.buttonRed,
              //                           borderRadius: BorderRadius.circular(4),
              //                         ),
              //                         child: KhaltiButton(
              //                           config: PaymentConfig(
              //                             amount: 10000,
              //                             productIdentity: 'dell-g5-g5510-2021',
              //                             productName: 'Dell G5s G5510 2021',
              //                           ),
              //                           preferences: [
              //                             // Not providing this will enable all the payment methods.
              //                             PaymentPreference.khalti,
              //                             PaymentPreference.eBanking,
              //                             PaymentPreference.connectIPS,
              //                           ],
              //                           onSuccess: (successModel) {
              //                             showDialog(
              //                                 context: context,
              //                                 builder: ((context) {
              //                                   return AlertDialog(
              //                                     title: Text('Success'),
              //                                     content: Text(
              //                                         'Payment successful'),
              //                                     actions: [
              //                                       TextButton(
              //                                         onPressed: () {
              //                                           Navigator.pop(context);
              //                                         },
              //                                         child: Text('OK'),
              //                                       ),
              //                                     ],
              //                                   );
              //                                 }));
              //                             // Navigator.push(context, route)
              //                             // Perform Server Verification
              //                           },
              //                           onFailure: (failureModel) {
              //                             showDialog(
              //                                 context: context,
              //                                 builder: ((context) {
              //                                   return AlertDialog(
              //                                     title: Text('Failure'),
              //                                     content:
              //                                         Text('Payment failed'),
              //                                     actions: [
              //                                       TextButton(
              //                                         onPressed: () {
              //                                           Navigator.pop(context);
              //                                         },
              //                                         child: Text('OK'),
              //                                       ),
              //                                     ],
              //                                   );
              //                                 }));
              //                             // What to do on failure?
              //                           },
              //                           onCancel: () {
              //                             showDialog(
              //                                 context: context,
              //                                 builder: ((context) {
              //                                   return AlertDialog(
              //                                     title: Text('Cancel'),
              //                                     content:
              //                                         Text('Payment cancelled'),
              //                                     actions: [
              //                                       TextButton(
              //                                         onPressed: () {
              //                                           Navigator.pop(context);
              //                                         },
              //                                         child: Text('OK'),
              //                                       ),
              //                                     ],
              //                                   );
              //                                 }));

              //                             // User manually cancelled the transaction
              //                           },
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              //   child: Container(
              //     height: 150,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       color: ColorUtils.grey,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Row(
              //       children: [
              //         Container(
              //           height: 150,
              //           width: 150,
              //           decoration: BoxDecoration(
              //             color: ColorUtils.buttonRed,
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Image.network(
              //             "https://cdn.pixabay.com/photo/2022/02/05/20/13/tulips-6995691__480.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(12.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 "Flower Vase",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w800,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "For Home, Hotels, and Cafe",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "Ceramics and Clay",
              //                 style: TextStyle(
              //                   color: Color.fromARGB(255, 107, 98, 98),
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w400,
              //                 ),
              //               ),
              //               Container(
              //                 width: 200,
              //                 child: Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       "Rs. 1,500",
              //                       style: TextStyle(
              //                         color: ColorUtils.themeBlack,
              //                         fontSize: 18,
              //                         fontWeight: FontWeight.w700,
              //                       ),
              //                     ),
              //                     GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                             builder: (context) => PaymentScreen(),
              //                           ),
              //                         );
              //                       },
              //                       child: Container(
              //                         height: 40,
              //                         width: 80,
              //                         decoration: BoxDecoration(
              //                           color: ColorUtils.buttonRed,
              //                           borderRadius: BorderRadius.circular(4),
              //                         ),
              //                         child: Center(
              //                           child: Text(
              //                             "Buy Now",
              //                             style: TextStyle(
              //                               color: ColorUtils.pureWhite,
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.w600,
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              //   child: Container(
              //     height: 150,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       color: ColorUtils.grey,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Row(
              //       children: [
              //         Container(
              //           height: 150,
              //           width: 150,
              //           decoration: BoxDecoration(
              //             color: ColorUtils.buttonRed,
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Image.network(
              //             "https://cdn.pixabay.com/photo/2016/11/19/17/25/furniture-1840463__480.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(12.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 "Table & Chair Set",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w800,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "For Home, Hotels, and Cafe",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "Forest Wood",
              //                 style: TextStyle(
              //                   color: Color.fromARGB(255, 107, 98, 98),
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w400,
              //                 ),
              //               ),
              //               Container(
              //                 width: 200,
              //                 child: Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       "Rs. 2,500",
              //                       style: TextStyle(
              //                         color: ColorUtils.themeBlack,
              //                         fontSize: 18,
              //                         fontWeight: FontWeight.w700,
              //                       ),
              //                     ),
              //                     GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                             builder: (context) => PaymentScreen(),
              //                           ),
              //                         );
              //                       },
              //                       child: Container(
              //                         height: 40,
              //                         width: 80,
              //                         decoration: BoxDecoration(
              //                           color: ColorUtils.buttonRed,
              //                           borderRadius: BorderRadius.circular(4),
              //                         ),
              //                         child: Center(
              //                           child: Text(
              //                             "Buy Now",
              //                             style: TextStyle(
              //                               color: ColorUtils.pureWhite,
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.w600,
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              //   child: Container(
              //     height: 150,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       color: ColorUtils.grey,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Row(
              //       children: [
              //         Container(
              //           height: 150,
              //           width: 150,
              //           decoration: BoxDecoration(
              //             color: ColorUtils.buttonRed,
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Image.network(
              //             "https://cdn.pixabay.com/photo/2015/05/11/22/38/picture-763262__480.png",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(12.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 "Bed Cushion",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w800,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "For Home & Hotels",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "Ceramics and Clay",
              //                 style: TextStyle(
              //                   color: Color.fromARGB(255, 107, 98, 98),
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w400,
              //                 ),
              //               ),
              //               Container(
              //                 width: 200,
              //                 child: Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       "Rs. 1,500",
              //                       style: TextStyle(
              //                         color: ColorUtils.themeBlack,
              //                         fontSize: 18,
              //                         fontWeight: FontWeight.w700,
              //                       ),
              //                     ),
              //                     GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                             builder: (context) => PaymentScreen(),
              //                           ),
              //                         );
              //                       },
              //                       child: Container(
              //                         height: 40,
              //                         width: 80,
              //                         decoration: BoxDecoration(
              //                           color: ColorUtils.buttonRed,
              //                           borderRadius: BorderRadius.circular(4),
              //                         ),
              //                         child: Center(
              //                           child: Text(
              //                             "Buy Now",
              //                             style: TextStyle(
              //                               color: ColorUtils.pureWhite,
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.w600,
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              //   child: Container(
              //     height: 150,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       color: ColorUtils.grey,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Row(
              //       children: [
              //         Container(
              //           height: 150,
              //           width: 150,
              //           decoration: BoxDecoration(
              //             color: ColorUtils.buttonRed,
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Image.network(
              //             "https://cdn.pixabay.com/photo/2018/08/09/03/58/home-3593729__480.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(12.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 "Bathtub",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w800,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "For Resorts & Spa",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "Ceramics, Polyster",
              //                 style: TextStyle(
              //                   color: Color.fromARGB(255, 107, 98, 98),
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w400,
              //                 ),
              //               ),
              //               Container(
              //                 width: 200,
              //                 child: Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       "Rs. 19,500",
              //                       style: TextStyle(
              //                         color: ColorUtils.themeBlack,
              //                         fontSize: 18,
              //                         fontWeight: FontWeight.w700,
              //                       ),
              //                     ),
              //                     GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                             builder: (context) => PaymentScreen(),
              //                           ),
              //                         );
              //                       },
              //                       child: Container(
              //                         height: 40,
              //                         width: 80,
              //                         decoration: BoxDecoration(
              //                           color: ColorUtils.buttonRed,
              //                           borderRadius: BorderRadius.circular(4),
              //                         ),
              //                         child: Center(
              //                           child: Text(
              //                             "Buy Now",
              //                             style: TextStyle(
              //                               color: ColorUtils.pureWhite,
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.w600,
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              //   child: Container(
              //     height: 150,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       color: ColorUtils.grey,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Row(
              //       children: [
              //         Container(
              //           height: 150,
              //           width: 150,
              //           decoration: BoxDecoration(
              //             color: ColorUtils.buttonRed,
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Image.network(
              //             "https://cdn.pixabay.com/photo/2017/10/04/14/50/staging-2816464__480.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(12.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 "Ceramics Vase",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w800,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "For Garden and Rooms",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "Ceramics & Mud",
              //                 style: TextStyle(
              //                   color: Color.fromARGB(255, 107, 98, 98),
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w400,
              //                 ),
              //               ),
              //               Container(
              //                 width: 200,
              //                 child: Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       "Rs. 3,400",
              //                       style: TextStyle(
              //                         color: ColorUtils.themeBlack,
              //                         fontSize: 18,
              //                         fontWeight: FontWeight.w700,
              //                       ),
              //                     ),
              //                     GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                             builder: (context) => PaymentScreen(),
              //                           ),
              //                         );
              //                       },
              //                       child: Container(
              //                         height: 40,
              //                         width: 80,
              //                         decoration: BoxDecoration(
              //                           color: ColorUtils.buttonRed,
              //                           borderRadius: BorderRadius.circular(4),
              //                         ),
              //                         child: Center(
              //                           child: Text(
              //                             "Buy Now",
              //                             style: TextStyle(
              //                               color: ColorUtils.pureWhite,
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.w600,
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              //   child: Container(
              //     height: 150,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       color: ColorUtils.grey,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Row(
              //       children: [
              //         Container(
              //           height: 150,
              //           width: 150,
              //           decoration: BoxDecoration(
              //             color: ColorUtils.buttonRed,
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Image.network(
              //             "https://cdn.pixabay.com/photo/2021/08/05/07/55/daffodils-6523446__480.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(12.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 "Flower Vase",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w800,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "For Home, Hotels, and Cafe",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "Ceramics and Clay",
              //                 style: TextStyle(
              //                   color: Color.fromARGB(255, 107, 98, 98),
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w400,
              //                 ),
              //               ),
              //               Container(
              //                 width: 200,
              //                 child: Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       "Rs. 1,500",
              //                       style: TextStyle(
              //                         color: ColorUtils.themeBlack,
              //                         fontSize: 18,
              //                         fontWeight: FontWeight.w700,
              //                       ),
              //                     ),
              //                     GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                             builder: (context) => PaymentScreen(),
              //                           ),
              //                         );
              //                       },
              //                       child: Container(
              //                         height: 40,
              //                         width: 80,
              //                         decoration: BoxDecoration(
              //                           color: ColorUtils.buttonRed,
              //                           borderRadius: BorderRadius.circular(4),
              //                         ),
              //                         child: Center(
              //                           child: Text(
              //                             "Buy Now",
              //                             style: TextStyle(
              //                               color: ColorUtils.pureWhite,
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.w600,
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              //   child: Container(
              //     height: 150,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       color: ColorUtils.grey,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Row(
              //       children: [
              //         Container(
              //           height: 150,
              //           width: 150,
              //           decoration: BoxDecoration(
              //             color: ColorUtils.buttonRed,
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Image.network(
              //             "https://cdn.pixabay.com/photo/2014/12/06/12/29/chair-558951__480.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(12.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 "Couch Set",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w800,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "For Home, Hotels, and Cafe",
              //                 style: TextStyle(
              //                   color: ColorUtils.themeBlack,
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "Cotton & Polyster",
              //                 style: TextStyle(
              //                   color: Color.fromARGB(255, 107, 98, 98),
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w400,
              //                 ),
              //               ),
              //               Container(
              //                 width: 200,
              //                 child: Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       "Rs. 22,500",
              //                       style: TextStyle(
              //                         color: ColorUtils.themeBlack,
              //                         fontSize: 18,
              //                         fontWeight: FontWeight.w700,
              //                       ),
              //                     ),
              //                     GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                             builder: (context) => PaymentScreen(),
              //                           ),
              //                         );
              //                       },
              //                       child: Container(
              //                         height: 40,
              //                         width: 80,
              //                         decoration: BoxDecoration(
              //                           color: ColorUtils.buttonRed,
              //                           borderRadius: BorderRadius.circular(4),
              //                         ),
              //                         child: Center(
              //                           child: Text(
              //                             "Buy Now",
              //                             style: TextStyle(
              //                               color: ColorUtils.pureWhite,
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.w600,
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
