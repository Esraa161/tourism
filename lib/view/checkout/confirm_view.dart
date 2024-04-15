import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturantapp/core/api_helper/cache_helper.dart';
import 'package:resturantapp/core/constants.dart';

import '../../core/IconBroken.dart';
import '../../core/enum.dart';
import '../../core/widgets/summary_listview.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/checkout_view_model.dart';

class SummaryView extends StatefulWidget {

  @override
  State<SummaryView> createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
  String _paymentMethod = '';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (contoller) => Scaffold(
        bottomNavigationBar: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            color: KPrimaryColor.withOpacity(0.1),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CartText(text1: 'Delivery', text2: '\$ 2'),
                    const SizedBox(
                      height: 10,
                    ),
                    CartText(text1: 'Delivery', text2: '\$ 90'),
                    const SizedBox(
                      height: 10,
                    ),
                    const DottedLine(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      lineLength: double.infinity,
                      lineThickness: 1.5,
                      dashLength: 4.0,
                      dashColor: Colors.grey,
                      // dashGradient: [Colors.red, Colors.blue],
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      // dashGapGradient: [Colors.red, Colors.blue],
                      dashGapRadius: 12,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Total Price'),
                        Spacer(),
                        const Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: KPrimaryColor),
                        ),
                        Text(
                          contoller.totalPrice.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Customer data',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                child: Icon(
                                  IconBroken.Profile,
                                ),
                              ),
                            ),
                            Text(
                              '${CacheHelper.getString(CustomerHelper.USER_NAME)}',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700),
                            )
                          ],),
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                child: Icon(
                                  IconBroken.Call,
                                ),
                              ),
                            ),
                            Text(
                              '01234567890',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700),
                            )
                          ],),

                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  child: Icon(
                                    IconBroken.Location,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  GetBuilder<CheckoutViewModel>(
                                      builder: (controller) =>
                                      controller.addresss.value ==
                                          Address.DefaultAddress
                                          ? Text(
                                        '${controller.defaultAddress}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade700),
                                      )
                                          : Text(
                                        '${controller.newAddress}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade700),
                                      )),
                                ],
                              )

                            ],
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'payment method',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ListTile(
                          title: Text('Cash'),
                          leading: Radio(
                            value: 'Cash',
                            groupValue: _paymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _paymentMethod = value!;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text('Visa'),
                          leading: Radio(
                            value: 'Visa',
                            groupValue: _paymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _paymentMethod = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Selected Payment Method: $_paymentMethod',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30,),
                Text(
                  'Order Items',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500),
                ),

                const SummaryListview(),
                const SizedBox(height: 20,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartText extends StatelessWidget {
  String text1;
  String text2;

  CartText({required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: TextStyle(color: Colors.grey.withOpacity(0.99999)),
        ),
        Spacer(),
        Text(
          text2,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
