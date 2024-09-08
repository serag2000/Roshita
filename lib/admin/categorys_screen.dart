import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/api/get_categorybyforadmin.dart';
import 'package:project/models/admin_model/all_categorys.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

late String token;

final _api = CategoryApi();
List<AllCategory> data = [];

Future<List<AllCategory>> getCategory() async {
  // isLoading = true;
  try {
    var response = await _api.getCategory('api/adminAuth/category');
    var result = jsonDecode(response.body)['data'];
    if (response.statusCode == 200) {
      data = result
          .map<AllCategory>((item) => AllCategory.fromJson(item))
          .toList();
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

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    getCategory();
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
          child: FutureBuilder<List<AllCategory>>(
        future: getCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
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
                  width: 300,
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (context) => AlertDialog(
                                      //     title: Column(
                                      //       children: [
                                      //         const Text(
                                      //             'the Advertisment has been deleted successfull',
                                      //             style:
                                      //                 TextStyle(color: Colors.black)),
                                      //         Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.spaceAround,
                                      //           children: [
                                      //             //     TextButton(onPressed: (){
                                      //             //   Navigator.pop(context);
                                      //             // }, child: Text('cancel' ,style: TextStyle(
                                      //             //   fontSize: 20
                                      //             // ),)),

                                      //             TextButton(
                                      //                 onPressed: () {
                                      //                   Navigator.pop(context);
                                      //                 },
                                      //                 child: const Text(
                                      //                   'OK',
                                      //                   style:
                                      //                       TextStyle(fontSize: 20),
                                      //                 )),
                                      //           ],
                                      //         )
                                      //       ],
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                    icon: const Icon(
                                      Icons.delete_forever_rounded,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset('assets/images/Dw.png',
                                    width: 100, height: 100),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${snapshot.data![index].id}'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('is simply dummy '),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text('${snapshot.data![index].name}'),
                                  ],
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
                                        onTap: () {},
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
              ],
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
