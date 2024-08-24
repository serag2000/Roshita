import 'package:flutter/material.dart';
import 'package:project/admin/add_product.dart';
import 'package:project/admin/home_screen_admin.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreenAdmin(),
                  ));
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Capsules ',
                  style: TextStyle(color: Colors.blue),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddProduct(),
                          ));
                    },
                    child: const Text('more')),
              ],
            ),
            SizedBox(
              height: 400,
              width: 300,
              child: ListView.builder(
                itemCount: 6,
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
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Lorem Ipsum'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('is simply dummy '),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('120 LYD '),
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
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.blue,
                                            width: 1,
                                          ),
                                        ),
                                        child: const Center(child: Text('Modify'))),
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
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Drop' ,style: TextStyle(color: Colors.blue),),
                Text('more', style: TextStyle(color: Colors.blue),)
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
              height: 400,
              width: 300,
              child: ListView.builder(
                  itemCount: 6,
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
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Lorem Ipsum'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('is simply dummy '),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('120 LYD '),
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
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.blue,
                                              width: 1,
                                            ),
                                          ),
                                          child: const Center(child: Text('Modify'))),
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
        ),
      ),
    );
  
  }
}