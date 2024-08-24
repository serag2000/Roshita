// import 'dart:convert';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:project/api/api_http.dart';
import 'package:project/customer/cart_screen.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/customer/profile_screen.dart';
import 'package:project/customer/settings_screen.dart';
import 'package:project/customer/view_doctors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/const.dart';
// import '../models/all_products.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//   final _api = Api();
//     List<   AllProduct>  data =[];

//   getHttp() async {
//     // SharedPreferences prefs = await SharedPreferences.getInstance();

//     // isLoading = true;
//     try {

//       var response = await _api
//           .get('api/recentProduct', {});
//       var result = json.decode(response.body);
//       if (response.statusCode == 200) {
//         // if (kDebugMode) {
//         //   print("access_token ===> ${result['access_token']}");
//         // }

//         // await prefs.setBool('islogin', true);
//         // await prefs.setString('token', result['access_token']);
//         // // ignore: use_build_context_synchronously

//       data = result.map((json) => AllProduct.fromJson(json)).toList();

//         // setCoins(data);
//       } else {
//         if (kDebugMode) {
//           print("response.statusCode ===> ${response.statusCode}");
//             print("data ====> $data");
//         }
//         if (kDebugMode) {
//           print("response ===> ${response.body}");
//         }
//         // ignore: use_build_context_synchronously
//         // mySnackBarBack(context, result["error"]);

//       // await prefs.setBool('islogin', false);
//       }
//     } catch (e) {

//       // await prefs.setBool('islogin', false);

//     }
//   }
//  @override
//   void initState() {
//    getHttp();
//     super.initState();
//   }

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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ));
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
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
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
                  // Container(
                  //   height: size.height / 15,
                  //   decoration: BoxDecoration(
                  //       color: Colors.grey[300],
                  //       borderRadius: BorderRadius.circular(150)),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         const Text(
                  //           "search",
                  //           style: TextStyle(color: Colors.grey),
                  //         ),
                  //         IconButton(
                  //             onPressed: () {
                  //               showSearch(
                  //                   context: context,
                  //                   delegate: Searchproducts());
                  //             },
                  //             icon: const Icon(
                  //               Icons.search,
                  //               color: Colors.grey,
                  //             ))
                  //       ],
                  //     ),
                  //   ),
                  // ),
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
                      child:
                          const ProductItem()), // في ملف الي اسمه ودجيت هوا الي في الكود الصولر و التفاصيل
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
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
              ListTile(
                leading: const Icon(Icons.shopping_cart_rounded),
                title: const Text('Cart'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ));
                },
              ),
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

