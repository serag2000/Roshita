import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/api/cart.dart';
import 'package:project/customer/cart_screen.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  int? productId;
  String? title;
  String? description;
  double? price;
  DetailsScreen({super.key,this.productId,required this.title, required this.description, required this.price});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}
final CartApi api = CartApi();
add(int? productId) async{
  try{
    var response = await api.addToCart(url:'api/userAuth/cart',productId: productId!);
    var result = jsonDecode(response.body);
    if(response.statusCode == 200){
      return result['message'];
    }

  }catch(e){
    if(kDebugMode){
      print("eror: $e");
    }
  }
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context
            );
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text('Details', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height / 2.5,
                    child: Image.asset('assets/images/Dw.png'),
                    width: double.infinity,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey[350],
                  ),
                  SizedBox(
                    height: size.width / 20,
                  ),
                  Text('${widget.title}',
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: size.width / 20,
                  ),
                  Text(
                      '${widget.description}'),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$ ${widget.price}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: size.width / 2.9,
            ),
            InkWell(
              onTap: () async {
                if(kDebugMode){
                  print("id :${widget.productId}");
                }
                // ignore: use_build_context_synchronously
                await add(widget.productId!) != '' ? Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen(),)) : const SnackBar(content: Text('error'));
              }
              ,
              child: Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: const Center(
                          child: Text('+',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Add to Cart",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
