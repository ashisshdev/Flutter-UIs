import 'package:flutter/material.dart';
import 'package:shoe_store_app/constants.dart';

class OrderConfirmScreen extends StatefulWidget {
  const OrderConfirmScreen({Key? key}) : super(key: key);

  @override
  State<OrderConfirmScreen> createState() =>
      _OrderConfirmScreenState();
}

class _OrderConfirmScreenState extends State<OrderConfirmScreen> {
  int _type = 1;
  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_outlined,
            color: Colors.black),
        title: const Text("Confirm",
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: Colors.black)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40.0),
                Container(
                  width: size.width,
                  height: 55.0,
                  decoration: BoxDecoration(
                    border: _type == 1
                        ? Border.all(width: 1.0, color: Colors.black)
                        : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor:
                                      SnkConstants.kPrimaryColor),
                              Text('Amazon pay',
                                  style: _type == 1
                                      ? const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)
                                      : const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey)),
                            ],
                          ),
                          Image.asset("assets/icons/amazon-pay.png",
                              width: 50.0),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  width: size.width,
                  height: 55.0,
                  decoration: BoxDecoration(
                    border: _type == 2
                        ? Border.all(width: 1.0, color: Colors.black)
                        : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: 2,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor:
                                      SnkConstants.kPrimaryColor),
                              Text('Credit card',
                                  style: _type == 2
                                      ? const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)
                                      : const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey)),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset("assets/icons/visa.png",
                                  width: 30.0),
                              const SizedBox(width: 8.0),
                              Image.asset(
                                  "assets/icons/mastercard.png",
                                  width: 30.0),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  width: size.width,
                  height: 55.0,
                  decoration: BoxDecoration(
                    border: _type == 3
                        ? Border.all(width: 1.0, color: Colors.black)
                        : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: 3,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor:
                                      SnkConstants.kPrimaryColor),
                              Text('Paypal',
                                  style: _type == 3
                                      ? const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)
                                      : const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey)),
                            ],
                          ),
                          Image.asset("assets/icons/paypal.png",
                              width: 50.0),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 150.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Sub-total',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),
                    Text('\$365.00',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Shipping fee',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),
                    Text('\$15.00',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 15.0),
                Container(
                    width: size.width,
                    height: 1.0,
                    color: Colors.grey),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total Payment',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    Text('\$380.00',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 80.0),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: 45.0,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: SnkConstants.kPrimaryColor,
                          borderRadius: const BorderRadius.all(
                              Radius.circular(10.0))),
                      child: const Center(
                        child: Text("Place order",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0)),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
