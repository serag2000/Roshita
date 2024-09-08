// import 'dart:convert';

// import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project/api/prdouct.dart';
// import 'package:project/api/api_http.dart';
import 'package:project/customer/cart_screen.dart';
import 'package:project/customer/details_screen.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/customer/profile_screen.dart';
import 'package:project/customer/settings_screen.dart';
import 'package:project/customer/view_doctors.dart';
import 'package:project/models/all_products.dart';
import 'package:project/widgets/login_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/const.dart';
// import '../models/all_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String token;

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  final _api = ProductApi();
  List<AllProduct> data = [];

  Future<List<AllProduct>> getProducts() async {
    // isLoading = true;
    try {
      var response = await _api.getProducts('api/recentProduct');
      var result = jsonDecode(response.body)['data'];
      if (response.statusCode == 200) {
        data = result
            .map<AllProduct>((item) => AllProduct.fromJson(item))
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

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.black),
            );
          },
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                String token = await getToken();
                if (token.isEmpty) {
                  loginDialog(context: context, size: size);
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(),
                      ));
                }
              },
              icon: const CircleAvatar(
                  backgroundColor: Color.fromRGBO(250, 249, 249, 1),
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                  )))
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: mainColor,
          backgroundColor: backgroundScreenColor,
          onRefresh: () => getProducts(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: FutureBuilder<List<AllProduct>>(
                  future: getProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/adv.png",
                                  width: size.width / 2,
                                  height: 200,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Image.asset(
                                  "assets/images/adv.png",
                                  width: size.width / 2,
                                  height: 200,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Image.asset(
                                  "assets/images/adv.png",
                                  width: size.width / 2,
                                  height: 200,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Image.asset(
                                  "assets/images/adv.png",
                                  width: size.width / 2,
                                  height: 200,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: size.width / 9,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Popular Product",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: mainTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  child: Text(
                                    "More",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: mainColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.width / 12,
                          ),
                          SizedBox(
                              width: double.infinity,
                              height: size.height * 1.5,
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                // padding: const EdgeInsets.all(24),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1 / 1.4,
                                  mainAxisSpacing: 24,
                                  crossAxisSpacing: 15,
                                  crossAxisCount: 2,
                                ),
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) => Container(
                                  width: size.width / 2.5,
                                  // height: size.width * 1,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    color: greyColor.withOpacity(0.1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: InkWell(
                                            onTap: () async {
                                              String token = await getToken();
                                              if (token.isEmpty) {
                                                loginDialog(
                                                    context: context,
                                                    size: size);
                                              } else {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailsScreen(
                                                              productId:
                                                                  snapshot
                                                                      .data?[
                                                                          index]
                                                                      .id,
                                                              title: snapshot
                                                                  .data?[index]
                                                                  .title,
                                                              description: snapshot
                                                                  .data?[index]
                                                                  .description,
                                                              price: snapshot
                                                                  .data?[index]
                                                                  .price)),
                                                );
                                              }
                                            },
                                            child: Image.asset(
                                              'assets/images/Dw.png',
                                              //"${snapshot.data?[index].imgUrl1}",
                                              height: size.width / 3.4,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          maxLines: 2,
                                          "${snapshot.data?[index].title}",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: mainTextColor,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "${snapshot.data![index].description}",
                                          style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                greyTextColor.withOpacity(0.8),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${snapshot.data?[index].price} D.L",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: mainColor,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                String token = await getToken();
                                                if (token.isEmpty) {
                                                  loginDialog(
                                                      context: context,
                                                      size: size);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailsScreen(
                                                                productId:
                                                                    snapshot
                                                                        .data?[
                                                                            index]
                                                                        .id,
                                                                title:
                                                                    snapshot
                                                                        .data?[
                                                                            index]
                                                                        .title,
                                                                description: snapshot
                                                                    .data?[
                                                                        index]
                                                                    .description,
                                                                price: snapshot
                                                                    .data?[
                                                                        index]
                                                                    .price)),
                                                  );
                                                }
                                              },
                                              child: Container(
                                                width: 60,
                                                height: 21,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: Colors.blue,
                                                      width: 2),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        height: 15,
                                                        width: 15,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                        child: const Center(
                                                          child: Text('+',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      10)),
                                                        ),
                                                      ),
                                                      const Text(
                                                        "Add",
                                                        style: TextStyle(
                                                          fontSize: 10,
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
                                        SizedBox(
                                          height: size.width / 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )), // في ملف الي اسمه ودجيت هوا الي في الكود الصولر و التفاصيل
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
                  }),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              // ListTile(
              //   leading: const Icon(Icons.home),
              //   title: const Text('Home'),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('View Doctors'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewDoctors(),
                      ));
                },
              ),
              // ListTile(
              //   leading: const Icon(Icons.shopping_cart_rounded),
              //   title: const Text('Cart'),
              //   onTap: () async {
              //     String token = await getToken();
              //     if (token.isEmpty) {
              //       loginDialog(context: context, size: size);
              //     } else {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const CartScreen(),
              //           ));
              //     }
              //   },
              // ),
              ListTile(
                leading: const Icon(Icons.archive),
                title: const Text('Archive'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log out'),
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('islogin', false);
                  await prefs.clear();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
