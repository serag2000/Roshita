// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:project/models/all_products.dart';

// import '../api/api_http.dart';
// import '../customer/details_screen.dart';
// import '../helper/const.dart';

// class ProductItem extends StatefulWidget {
//   // List< AllProduct>  data;
//   ProductItem({super.key,
//   //  required this.data
//    });

//   @override
//   State<ProductItem> createState() => _ProductItemState();
// }

// class _ProductItemState extends State<ProductItem> {
//   final _api = Api();

//    Future<List<AllProduct>> getHttp() async {
//     // SharedPreferences prefs = await SharedPreferences.getInstance();
//    List<   AllProduct>  data =[];

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

//       List<   AllProduct>   data = result.map((json) => AllProduct.fromJson(json)).toList();

//         // setCoins(data);
//       } else {
//         // if (kDebugMode) {
//         //   print("response.statusCode ===> ${response.statusCode}");
//         //     print("data ====> $data");
//         // }
//         // if (kDebugMode) {
//         //   print("response ===> ${response.body}");
//         // }
//         // ignore: use_build_context_synchronously
//         // mySnackBarBack(context, result["error"]);

//       // await prefs.setBool('islogin', false);
//       }
//     } catch (e) {

//       // await prefs.setBool('islogin', false);

//     }
//     return data;
//   }
//  @override
//   void initState() {
//    getHttp();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size ;
//     return  FutureBuilder<List<AllProduct>>(
//         future:getHttp() ,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//                 child: CircularProgressIndicator(
//               backgroundColor: mainColor,
//             ));
//           } else if (snapshot.hasError) {
//     return const SizedBox();
//           }
//           else{
//              List<AllProduct> data = snapshot.data ?? [];
//             //  setState(() {

//             //  });
//             return  data.isEmpty? const SizedBox():

//            GridView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       // padding: const EdgeInsets.all(24),
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         childAspectRatio: 1 / 1.4,
//                         mainAxisSpacing: 24,
//                         crossAxisSpacing: 15,
//                         crossAxisCount: 2,
//                       ),
//                       itemCount: data.length,
//                       itemBuilder: (context, index) => Container(
//                         width: size.width / 2.5,
//                         // height: size.width * 1,
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(5),
//                           ),
//                           color: greyColor.withOpacity(0.1),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Center(
//                                 child: InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               const DetailsScreen()),
//                                     );
//                                   },
//                                   child: Image.asset(
//                                     "assets/images/hh.JPG",
//                                     height: size.width / 3.4,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                             Text(
//                                 data[index].title??"",
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                   color: mainTextColor,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 2,
//                               ),
//                               Text(
//                                 "Is Simply Dummy Text Of The Printing.",
//                                 style: TextStyle(
//                                   fontSize: 9,
//                                   fontWeight: FontWeight.bold,
//                                   color: greyTextColor.withOpacity(0.8),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   const Text(
//                                     "\$120LYD",
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold,
//                                       color: mainColor,
//                                     ),
//                                   ),
//                                   InkWell(
//                                     onTap: () {},
//                                     child: Container(
//                                       width: 60,
//                                       height: 21,
//                                       decoration: BoxDecoration(
//                                         color: Colors.blue,
//                                         borderRadius: BorderRadius.circular(5),
//                                         border: Border.all(
//                                             color: Colors.blue, width: 2),
//                                       ),
//                                       child: Center(
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceAround,
//                                           children: [
//                                             Container(
//                                               height: 15,
//                                               width: 15,
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(10),
//                                                   border: Border.all(
//                                                     color: Colors.white,
//                                                   )),
//                                               child: const Center(
//                                                 child: Text('+',
//                                                     style: TextStyle(
//                                                         color: Colors.white,
//                                                         fontSize: 10)),
//                                               ),
//                                             ),
//                                             const Text(
//                                               "Add",
//                                               style: TextStyle(
//                                                 fontSize: 10,
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: size.width / 12,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ;
//           }

//         });

//   }
// }

import 'package:flutter/material.dart';

import '../helper/const.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      // padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1 / 1.4,
        mainAxisSpacing: 24,
        crossAxisSpacing: 15,
        crossAxisCount: 2,
      ),
      itemCount: 10,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   //MaterialPageRoute(builder: (context) => const DetailsScreen()),
                    // );
                  },
                  child: Image.asset(
                    "assets/images/Dw.png",
                    height: size.width / 3.4,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Lotem lpsum",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: mainTextColor,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "Is Simply Dummy Text Of The Printing.",
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: greyTextColor.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "120 LYD",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 21,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white,
                                  )),
                              child: const Center(
                                child: Text('+',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10)),
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
    );
  }
}
