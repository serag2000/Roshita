// SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             "assets/images/adv.png",
//                             width: size.width / 2,
//                             height: 200,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Image.asset(
//                             "assets/images/adv.png",
//                             width: size.width / 2,
//                             height: 200,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Image.asset(
//                             "assets/images/adv.png",
//                             width: size.width / 2,
//                             height: 200,
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Image.asset(
//                             "assets/images/adv.png",
//                             width: size.width / 2,
//                             height: 200,
//                           ),
//                         ],
//                       ),
//                     ),
                
//                     SizedBox(
//                       height: size.width / 9,
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 5,
//                       ),
//                       child: Row(
//                         children: [
//                           Text(
//                             "Popular Product",
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: mainTextColor,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           InkWell(
//                             child: Text(
//                               "More",
//                               style: TextStyle(
//                                 fontSize: 10,
//                                 color: mainColor,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: size.width / 12,
//                     ),
//////////////////////////////////////
///
///Column(
                  
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text("snap: ${snapshot.data}"),
    //                 SingleChildScrollView(
    //                   scrollDirection: Axis.horizontal,
    //                   child: Row(
    //                     children: [
    //                       Image.asset(
    //                         "assets/images/adv.png",
    //                         width: size.width / 2,
    //                         height: 200,
    //                       ),
    //                       const SizedBox(
    //                         width: 20,
    //                       ),
    //                       Image.asset(
    //                         "assets/images/adv.png",
    //                         width: size.width / 2,
    //                         height: 200,
    //                       ),
    //                       const SizedBox(
    //                         width: 20,
    //                       ),
    //                       Image.asset(
    //                         "assets/images/adv.png",
    //                         width: size.width / 2,
    //                         height: 200,
    //                       ),
    //                       const SizedBox(
    //                         width: 20,
    //                       ),
    //                       Image.asset(
    //                         "assets/images/adv.png",
    //                         width: size.width / 2,
    //                         height: 200,
    //                       ),
    //                     ],
    //                   ),
    //                 ),
                
    //                 SizedBox(
    //                   height: size.width / 9,
    //                 ),
    //                 const Padding(
    //                   padding: EdgeInsets.symmetric(
    //                     horizontal: 5,
    //                   ),
    //                   child: Row(
    //                     children: [
    //                       Text(
    //                         "Popular Product",
    //                         style: TextStyle(
    //                           fontSize: 12,
    //                           color: mainTextColor,
    //                           fontWeight: FontWeight.w500,
    //                         ),
    //                       ),
    //                       InkWell(
    //                         child: Text(
    //                           "More",
    //                           style: TextStyle(
    //                             fontSize: 10,
    //                             color: mainColor,
    //                             fontWeight: FontWeight.w500,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: size.width / 12,
    //                 ),
    //                 SizedBox(
    //                     width: double.infinity,
    //                     height: size.height * 1.5,
    //                     child:
    //                         GridView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   // padding: const EdgeInsets.all(24),
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     childAspectRatio: 1 / 1.4,
    //     mainAxisSpacing: 24,
    //     crossAxisSpacing: 15,
    //     crossAxisCount: 2,
    //   ),
    //   itemCount: snapshot.data!.length,
    //   itemBuilder: (context, index) => Container(
    //     width: size.width / 2.5,
    //     // height: size.width * 1,
    //     decoration: BoxDecoration(
    //       borderRadius: const BorderRadius.all(
    //         Radius.circular(5),
    //       ),
    //       color: greyColor.withOpacity(0.1),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.all(10.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Center(
    //             child: InkWell(
    //               onTap: () {
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(builder: (context) => const DetailsScreen()),
    //                 );
    //               },
    //               child: Image.asset(
    //                 "assets/images/Dw.png",
    //                 height: size.width / 3.4,
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           const Text(
    //             "Lotem lpsum",
    //             style: TextStyle(
    //               fontSize: 12,
    //               fontWeight: FontWeight.bold,
    //               color: mainTextColor,
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 2,
    //           ),
    //           Text(
    //             "Is Simply Dummy Text Of The Printing.",
    //             style: TextStyle(
    //               fontSize: 9,
    //               fontWeight: FontWeight.bold,
    //               color: greyTextColor.withOpacity(0.8),
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               const Text(
    //                 "120 LYD",
    //                 style: TextStyle(
    //                   fontSize: 12,
    //                   fontWeight: FontWeight.bold,
    //                   color: mainColor,
    //                 ),
    //               ),
    //               InkWell(
    //                 onTap: () {},
    //                 child: Container(
    //                   width: 60,
    //                   height: 21,
    //                   decoration: BoxDecoration(
    //                     color: Colors.blue,
    //                     borderRadius: BorderRadius.circular(5),
    //                     border: Border.all(color: Colors.blue, width: 2),
    //                   ),
    //                   child: Center(
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                       children: [
    //                         Container(
    //                           height: 15,
    //                           width: 15,
    //                           decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(10),
    //                               border: Border.all(
    //                                 color: Colors.white,
    //                               )),
    //                           child: const Center(
    //                             child: Text('+',
    //                                 style: TextStyle(
    //                                     color: Colors.white, fontSize: 10)),
    //                           ),
    //                         ),
    //                         const Text(
    //                           "Add",
    //                           style: TextStyle(
    //                             fontSize: 10,
    //                             color: Colors.white,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: size.width / 12,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // )), // في ملف الي اسمه ودجيت هوا الي في الكود الصولر و التفاصيل
    //               ],
    //             ),