import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/api/show_cart.dart';
import 'package:project/customer/login_screen.dart';

import 'package:project/models/show_cart.dart';

import '../../helper/const.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

late String token;
bool isLoading = false;

final ShowCartApi _api = ShowCartApi();
List<CartItem> data = [];
double totalInvoice = 0;

void calculateTotal() {
  totalInvoice = 0;
  for (int i = 0; i < data.length; i++) {
    totalInvoice = totalInvoice + data[i].total;
  }
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    show();
    super.initState();
  }

  Future<void> removeItem(
      {required BuildContext context, required int id}) async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await _api.removeItemFromCart(
        url: 'api/userAuth/cart/$id',
      );
      if (kDebugMode) {
        print(response.body);
      }
      var result = jsonDecode(response.body);
      // ignore: use_build_context_synchronously
      mySnackBarBack(context, 'done');
    } catch (e) {
      mySnackBarBack(context, e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> show() async {
    // isLoading = true;
    try {
      setState(() {
        isLoading = true;
      });

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
    calculateTotal();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Cart",
          style: TextStyle(
            fontSize: 14,
            color: mainTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: RefreshIndicator(
          color: mainColor,
          backgroundColor: backgroundScreenColor,
          onRefresh: () => show(),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : data.isEmpty
                  ? const Center(
                      child: Text(
                        "لا يوجد منتج في السلة",
                        style: TextStyle(
                          fontSize: 18,
                          color: mainTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: size.height / 1.7,
                            child: isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    //physics:  NeverScrollableScrollPhysics(),
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    itemCount: data.length,
                                    itemBuilder: (context, index) =>
                                        SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/Dw.png",
                                                  width: size.width / 5,
                                                  height: size.width / 5,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // SizedBox(
                                                    //   height: 5,
                                                    // ),
                                                    Text(
                                                      data[index].productTitle,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: mainTextColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //   height: 5,
                                                    // ),
                                                    const Text(
                                                      "is simply dummy text of the printing.",
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        color: greyTextColor,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "${data[index].total}",
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color: mainTextColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              if (data[index]
                                                                      .cartQty >
                                                                  1) {
                                                                setState(() {
                                                                  data[index]
                                                                          .cartQty =
                                                                      data[index]
                                                                              .cartQty -
                                                                          1;
                                                                  data[index]
                                                                      .total = data[
                                                                              index]
                                                                          .cartQty *
                                                                      data[index]
                                                                          .price;
                                                                  calculateTotal();
                                                                });
                                                              }
                                                            },
                                                            child: const Text(
                                                              '-',
                                                              style: TextStyle(
                                                                  fontSize: 20),
                                                            )),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                            "${data[index].cartQty}"),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              if (kDebugMode) {
                                                                print(data[
                                                                        index]
                                                                    .cartQty);
                                                              }
                                                              // Provider.of<counter>(context).increase();
                                                              setState(() {
                                                                if (kDebugMode) {
                                                                  print(data[
                                                                          index]
                                                                      .cartQty);
                                                                }
                                                                data[index]
                                                                        .cartQty =
                                                                    data[index]
                                                                            .cartQty +
                                                                        1;
                                                                data[index]
                                                                    .total = data[
                                                                            index]
                                                                        .cartQty *
                                                                    data[index]
                                                                        .price;
                                                                calculateTotal();
                                                              });
                                                            },
                                                            child: const Text(
                                                              '+',
                                                              style: TextStyle(
                                                                  fontSize: 20),
                                                            )),
                                                        SizedBox(
                                                          width:
                                                              size.width / 2.8,
                                                        ),
                                                        IconButton(
                                                            onPressed:
                                                                () async {
                                                              await removeItem(
                                                                  context:
                                                                      context,
                                                                  id: data[
                                                                          index]
                                                                      .id);
                                                              await show();
                                                            },
                                                            icon: const Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            ))
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // separatorBuilder: (context, index) => Container(
                                    //   width: double.infinity,
                                    //   height: 1,
                                    //   color: Colors.grey[300],
                                    // ),
                                  )),

                        // SizedBox(
                        //   height: size.width / 12,
                        // ),
                      ],
                    ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "In Total",
                    style: TextStyle(
                      fontSize: 14,
                      color: mainTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$ $totalInvoice",
                    style: const TextStyle(
                      fontSize: 14,
                      color: mainTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.width / 20,
            ),
            InkWell(
              onTap: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CheckoutScreen(data: data, total: totalInvoice),
                    ));
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
                    "Check out",
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
    );
  }
}

// class ContinerCartScreen extends StatefulWidget {
//   const ContinerCartScreen({super.key});

//   @override
//   State<ContinerCartScreen> createState() => _ContinerCartScreenState();
// }

// class _ContinerCartScreenState extends State<ContinerCartScreen> {
//   int index=1;
//   @override
//   Widget build(BuildContext context) {
    
//     Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Stack(
//             alignment: Alignment.bottomRight,
//             children: [
//               Row(
//                 children: [
//                   Image.asset(
//                     "assets/images/Dw.png",
//                     width: size.width / 5,
//                     height: size.width / 5,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                    Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // SizedBox(
//                       //   height: 5,
//                       // ),
//                       const Text(
//                         "Lorem lpsum",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: mainTextColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       // SizedBox(
//                       //   height: 5,
//                       // ),
//                       const Text(
//                         "is simply dummy text of the printing.",
//                         style: TextStyle(
//                           fontSize: 10,
//                           color: greyTextColor,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Text(
//                     "\$120LYD",
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: mainTextColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                      InkWell
//                      (
//                       onTap: () {
//                         if (index > 1) {
//                             setState(() {
//                               index--;
//                             });
//                           }
//                       },
//                       child: const Text('-', style: TextStyle(
//                         fontSize: 20
//                       ),)),
      
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Text('${index}'),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                      InkWell
//                      (
//                       onTap: () {
//                         // Provider.of<counter>(context).increase();
//                             setState(() {
//                               index++;
//                             });
                          
//                       },
//                       child: const Text('+', style: TextStyle(
//                         fontSize: 20
//                       ),)
//                      ) ,
//                      SizedBox(
//                       width: size.width/2.8,
//                      ),
//                      IconButton(onPressed: () {
                       
//                      }, icon: const Icon(Icons.delete , color: Colors.red,))
//                     ],
//                   ),
      
//                     ],
//                   ),
//                 ],
//               ),
//                ],
//           ),
//         ),
//       ),
//     );
//   }
// }