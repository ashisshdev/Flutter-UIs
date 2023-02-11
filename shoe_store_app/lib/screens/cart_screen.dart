import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_outlined,
            color: Colors.black, size: 18.0),
        title: const Text("Cart",
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: Colors.black)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 130.0,
                    height: 90.0,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius:
                            BorderRadius.all(Radius.circular(15.0)),
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/item.png"),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(width: 30.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10.0),
                      const Text('Nike Air Huarache',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                      const SizedBox(height: 7.0),
                      const Text('NIKE Men\'s Shoes | US7.5',
                          style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey)),
                      const SizedBox(height: 10.0),
                      Row(
                        children: const [
                          Text('\$120',
                              style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          SizedBox(width: 120.0),
                          Text('x 1',
                              style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 130.0,
                    height: 90.0,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius:
                            BorderRadius.all(Radius.circular(15.0)),
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/item2.png"),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(width: 30.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10.0),
                      const Text('LeBron 19 Low',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                      const SizedBox(height: 7.0),
                      const Text('Basketball Shoes | US7.5',
                          style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey)),
                      const SizedBox(height: 10.0),
                      Row(
                        children: const [
                          Text('\$160',
                              style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          SizedBox(width: 120.0),
                          Text('x 1',
                              style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 180.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Sub-total',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey)),
                  Text('\$280.00',
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
                  width: size.width, height: 1.0, color: Colors.grey),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Total Payment',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  Text('\$295.00',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                ],
              ),
              const SizedBox(height: 70.0),
              GestureDetector(
                onTap: () {},
                child: Container(
                    height: 45.0,
                    width: size.width,
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.all(Radius.circular(10.0))),
                    child: const Center(
                      child: Text("Check out",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0)),
                    )),
              ),
              const SizedBox(height: 20.0),
              const Center(
                  child: Text('Continue Shopping',
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54)))
            ],
          ),
        ),
      ),
    );
  }
}
