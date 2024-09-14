import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/admin/modify_screen.dart';
import 'package:project/api/product_control.dart';
import 'package:project/models/all_products.dart';

class ProductAdmin extends StatefulWidget {
  const ProductAdmin({super.key});

  @override
  State<ProductAdmin> createState() => _ProductAdminState();
}

late String token;

final _api = CreateProductApi();
List<AllProduct> data = [];

Future<List<AllProduct>> show() async {
  // isLoading = true;
  try {
    var response = await _api.getProducts('api/adminAuth/product');
    var result = jsonDecode(response.body)['data'];
    if (response.statusCode == 200) {
      data =
          result.map<AllProduct>((item) => AllProduct.fromJson(item)).toList();
      if (kDebugMode) {
        print("data:" + result);
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

class _ProductAdminState extends State<ProductAdmin> {
  @override
  void initState() {
    show();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const HomeScreenAdmin(),
              //     ));
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.black),
            );
          }),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: show(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Drop',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Text(
                        'more',
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 650,
                    width: 500,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 300,
                          height: 190,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blue)),
                          child: Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.delete_forever_rounded,
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/Dw.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                    Expanded(
                                      // استخدم Expanded هنا لتوفير المساحة المتاحة
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${snapshot.data![index].title}',
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${snapshot.data![index].price} ',
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            '${snapshot.data![index].description}',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Modifyscreen(),
                                                  ));
                                            },
                                            child: Container(
                                                width: 100,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.blue,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: const Center(
                                                    child: Text('Modify'))),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox(
              height: size.height * 0.65,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            );
          }
        },
      )),
    );
  }
}
