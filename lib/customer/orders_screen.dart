import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/api/show_invoice.dart';
import 'package:project/customer/home_screen.dart';
import 'package:project/models/show_cart.dart';

import 'package:project/models/show_invoice.dart';
import 'package:project/tabs_screen.dart';


import '../helper/const.dart';

class OrderScreen extends StatefulWidget {
   OrderScreen({super.key,required this.data,required this.total});
  late List<CartItem> data;
  late double total;
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}






class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: const Text('Your Orders',
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 1,
            color: Colors.grey[300],
          ),
          SizedBox(
            height: 600,
            width: size.width,
            child: ListView.builder(
                    itemCount: widget.data.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: size.height*0.02),
                          child: Row(
                            children: [
                              SizedBox(width: size.width*0.02,),
                              Text('${widget.data[index].cartQty} x ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                                     SizedBox(width: size.width*0.015,),
                        
                              Image.asset(
                                'assets/images/Dw.png',
                                width: 100,
                                height: 100,
                              ),
                               const Spacer(flex: 2),
                              
                              Text('${widget.data[index].productTitle}',
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 17)),
                                       const Spacer(flex: 2),
                                      Text('${widget.data[index].price} Dly ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
          ),
           Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Row(
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
                  '${widget.total}LYD',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Padding(
              padding: EdgeInsets.all(20.0),
              child: 
            InkWell(
              onTap: () async {
                Navigator.of(context).pushAndRemoveUntil(
                 MaterialPageRoute(builder: (context) => TabsScreen()), (route) => false);
              },
              child: Container(
                width:double.infinity,
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
             ),
          ],
        ),
      ),
    );
  }
}

      //  RefreshIndicator(
      //   onRefresh: () => show(),
      //  color: Colors.blue, 
      //   child: Column(
          
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(
      //         height: 1,
      //         color: Colors.grey[300],
      //       ),
      //       SizedBox(
      //         height: 220,
      //         child: FutureBuilder<List<Showinvoice>>( 
      //           future:show() ,
      //           builder: (context, snapshot) {
      //             if(snapshot.hasData){
      //               return ListView.builder(
      //             itemCount: snapshot.data!.length,
      //             itemBuilder: (context, index) => Column(
                    
      //     //crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Row(
      //         children: [
      //           SizedBox(
      //             width: size.width / 18,
      //           ),
      //            Text('${snapshot.data![index].productName}',
      //             style: TextStyle(color: Colors.blue, fontSize: 17)),
      //           Image.asset(
      //             'assets/images/Dw.png',
      //             width: 100,
      //             height: 100,
      //           ),
      //            Text('${snapshot.data![index].cartQty}',
      //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      //            Text('',
      //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      //         ],
      //       ),
      //     ],
      //   ),
                
      //           );
      //             }else{
      //               return  SizedBox(
      //                       height: size.height*0.65,
      //                       child:const Center(
      //                         child:   CircularProgressIndicator(
      //                           color: Colors.black,
      //                         ),
      //                       ),
      //                     );
      //             }
      //           },
      //         ),
      //       ),
      //       const Padding(
      //         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(
      //               'Total',
      //               style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 16,
      //               ),
      //             ),
      //             Text(
      //               '350LYD',
      //               style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 16,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       // Padding(
      //       //   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      //       //   child: InkWell(
      //       //     onTap: () {
      //       //       Navigator.push(context, MaterialPageRoute(builder: (context) =>const ViewDetails(),));
      //       //     },
      //       //     child: Container(
      //       //       width: size.width / 3,
      //       //       height: size.width / 11,
      //       //       decoration: BoxDecoration(
      //       //         borderRadius: BorderRadius.circular(5),
      //       //         color: mainColor,
      //       //         border: Border.all(color: mainColor, width: 2),
      //       //       ),
      //       //       child: const Center(
      //       //         child: Text(
      //       //           "View Details",
      //       //           textAlign: TextAlign.center,
      //       //           style: TextStyle(
      //       //             fontSize: 14,
      //       //             // fontWeight: FontWeight.bold,
      //       //             color: backgroundScreenColor,
      //       //           ),
      //       //         ),
      //       //       ),
      //       //     ),
      //       //   ),
      //       // ),
      //       Container(
      //         height: 1,
      //         color: Colors.grey[300],
      //       ),
      //       SizedBox(
      //         height: size.width / 2,
      //       ),
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => const TabsScreen(),
      //               ));
      //         },
      //         child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Container(
      //             //width: size.width / 1.1,
      //             height: size.width / 10,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(10),
      //               color: mainColor,
      //               border: Border.all(color: mainColor, width: 2),
      //             ),
      //             child: const Center(
      //               child: Text(
      //                 "Home Screen",
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                   fontSize: 14,
      //                   // fontWeight: FontWeight.bold,
      //                   color: backgroundScreenColor,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    

// class ListOrder extends StatelessWidget {
//   const ListOrder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         //crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               SizedBox(
//                 width: size.width / 18,
//               ),
//               const Text('2', style: TextStyle(color: Colors.blue, fontSize: 17)),
//               Image.asset(
//                 'assets/images/Dw.png',
//                 width: 100,
//                 height: 100,
//               ),
//               const Text('Lorem Ipsum  .',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
//               const Text('120LYD',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ViewDetails extends StatelessWidget {
//   const ViewDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: const Text('Your Orders',
//             style: TextStyle(
//               color: Colors.black,
//             )),
//             leading: IconButton(onPressed: (){
//               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const OrderScreen(),));
//             }, icon: const Icon(Icons.arrow_back , color: Colors.black,)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Container(
//               height: 2,
//               color: Colors.grey[300],
//             ),
//             SizedBox(
//               height: size.width / 15,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     const Text('Order:  ', style: TextStyle(fontWeight: FontWeight.bold)),
//                     Text('#12345', style: TextStyle(color: Colors.blue[500])),
//                     SizedBox(
//                       width: size.width / 3,
//                     ),
//                     const Text('08:52AM'),
//                     const Text('20 March 2024'),
//                   ],
//                 ),
//                 SizedBox(
//                   height: size.width / 25,
//                 ),
//                 const Text('Payment by: Mobi Cash'),
//               ],
//             ),
//             SizedBox(
//               height: size.width / 15,
//             ),
//             Container(
//               height: 2,
//               color: Colors.grey[300],
//             ),
//             SizedBox(
//               height: 250,
//               child: ListView.builder(
//                 itemCount: 2,
//                 itemBuilder: (context, index) => Row(
//                 children: [
//                   SizedBox(
//                     width: size.width / 18,
//                   ),
//                   const Text('2', style: TextStyle(color: Colors.blue, fontSize: 17)),
//                   Image.asset(
//                     'assets/images/Dw.png',
//                     width: 100,
//                     height: 100,
//                   ),
//                   const Text('Lorem Ipsum  .',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
//                   const Text('120LYD',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
//                 ],
//               ),
//                       ),
//             ),
//              const Padding(
//             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Total',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 Text(
//                   '350LYD',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//           ),
          
//             ],
//         ),
//       ),
//     );
//   }
// }
