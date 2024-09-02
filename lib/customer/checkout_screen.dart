import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/api/cart.dart';
import 'package:project/api/check_out.dart';
import 'package:project/customer/cart_screen.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/customer/orders_screen.dart';
import 'package:project/models/checkOut.dart';

import '../helper/const.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}
late String token;
TextEditingController phone = TextEditingController();
TextEditingController address = TextEditingController();
bool isLoading = false;

void alert({required BuildContext context, required Size size}){
       showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              title: Column(children: [
                            Image.asset('assets/images/checkout.png',
                                width: 150, height: 150),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text('Order Success!'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Your order has been placed successfully!  ',
                                style: TextStyle(fontSize: 14)),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const OrderScreen(),
                                    ));
                              },
                              child: Container(
                                width: size.width / 1.1,
                                height: size.width / 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: mainColor,
                                  border:
                                      Border.all(color: mainColor, width: 2),
                                ),
                                child: const Center(
                                  child: Text(
                                    "show invoice",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                      color: backgroundScreenColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ])));
}

Future <void> submitCheckOut({required BuildContext context, required Size size}) async{
  isLoading = true;
  int code =await CeckOutApi.checkOut(Phone: phone.text,address: address.text);
   if(code == 200 || code == 201){
    alert(context: context, size: size);
    phone.clear();
    address.clear();

   }else{
    void alertFaild({required BuildContext context, required Size size}){
       showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              title: Column(children: [
                            Image.asset('assets/images/error.png',
                                width: 150, height: 150),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text('Error!'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Your order has been Faild !  ',
                                style: TextStyle(fontSize: 14)),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: size.width / 1.1,
                                height: size.width / 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: mainColor,
                                  border:
                                      Border.all(color: mainColor, width: 2),
                                ),
                                child: const Center(
                                  child: Text(
                                    "show invoice",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                      color: backgroundScreenColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ])));
}


   }
   isLoading =false;
}
final _api = showInvoiceApi();

showInvoiceApi() {
}
List<CartItem> data = [];

Future<List<CartItem>> show() async {
  // isLoading = true;
  try {
    var response = await _api.showCart('api/userAuth/cart');
    var result = jsonDecode(response.body)['data'];
    if (response.statusCode == 200) {
      data = result.map<CartItem>((item) => CartItem.fromJson(item)).toList();
      if (kDebugMode) {
        print("token:" + token.toString());
        // print("dddd ${jsonDecode(response.body)['data']}");
        // print("res: $result");
        // print("resultssss ===> ${data}");
      }

      // await prefs.setBool('islogin', true);
      // await prefs.setString('token', result['access_token']);
      // // ignore: use_build_context_synchronously

      // setCoins(data);
    } else {
      if (kDebugMode) {
        print("response.statusCode ===> ${response.statusCode}");
        print("data ====> $data");
      }
      if (kDebugMode) {
        print("response ===> ${response.body}");
      }
      // ignore: use_build_context_synchronously
      // mySnackBarBack(context, result["error"]);

      // await prefs.setBool('islogin', false);
    }
  } catch (e) {
    // await prefs.setBool('islogin', false)
  }

  return data;
}
class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Checkout',
            style: TextStyle(
              color: Colors.black,
            )),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Receipt',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.width / 20,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemBuilder: (context, index) => const Receipt(),
                  itemCount: 2,
                ),
              ),
              SizedBox(
                height: size.width / 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '350LYD',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width / 20,
              ),
              Container(
                height: 1,
                color: Colors.grey[300],
              ),
              const Text(
                'Checkout Details',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: address,
                decoration: const InputDecoration(
                  label: Text('address'),
                ),
              ),
              TextFormField(
                controller: phone,
                decoration: const InputDecoration(
                  label: Text('Phone Number'),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 180,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Card Number'),
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Confirmation Number'),
                ),
              ),
              SizedBox(
                height: size.width / 20,
              ),
              InkWell(
                onTap: () async {
                  if(phone.text.isEmpty || address.text.isEmpty){
                    mySnackBarBack(context, 'Please input your Address and your Phone ');

                  }else{
                   submitCheckOut(context: context,size: size);
                  }
                 
                },
                child: Container(
                  width: size.width / 1.1,
                  height: size.width / 6.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mainColor,
                    border: Border.all(color: mainColor, width: 2),
                  ),
                  child: const Center(
                    child: Text(
                      "Confirm Checkout",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                        color: backgroundScreenColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/Dw.png',
              width: 100,
              height: 100,
            ),
            const Text('Lorem Ipsum  .',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const Text('120LYD',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
        Container(
          height: 1,
          color: Colors.grey[350],
          width: size.width / 1.5,
        ),
      ],
    );
  }
}
