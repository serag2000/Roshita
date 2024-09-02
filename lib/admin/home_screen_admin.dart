

import 'package:flutter/material.dart';
import 'package:project/admin/add_product.dart';
import 'package:project/admin/adv.dart';
import 'package:project/admin/categorys_screen.dart';
import 'package:project/admin/doctors_page.dart';
import 'package:project/admin/modify_screen.dart';
import 'package:project/admin/pharmacist_page.dart';
import 'package:project/customer/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenAdmin extends StatefulWidget {
  const HomeScreenAdmin({super.key});

  @override
  State<HomeScreenAdmin> createState() => _HomeScreenAdminState();
}

class _HomeScreenAdminState extends State<HomeScreenAdmin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu, color: Colors.black),
          );
        }),
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Capsules'),
              TextButton(onPressed: () {}, child: const Text('More')),
            ],
          ),
          SizedBox(
            height: 200,
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
                 border: Border.all(
                  color: Colors.blue
                 )
                ),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Modifyscreen(),));
                            },
                            child: Container(
                              width: 80,
                              
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.blue, width: 1),
                              ),
                              child: const Center(child: Text('Modify')),
                            ),
                          )
                        ],
                      ),
                    ),
                    
                  ],
                ),
                
                          ),
              ),
                  ),
          )],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('Catogory'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryScreen(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text('Search'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.medical_services_outlined),
                title: const Text('Products'),
                onTap: () {
                  
                },
              ),
              ListTile(
                leading: const Icon(Icons.campaign_rounded),
                title: const Text('Advertisment'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Adv(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_business_rounded),
                title: const Text('Add Product'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AddProduct(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_2_sharp),
                title: const Text('Docotrs'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorsPage(),));
                },
              ),
      
              ListTile(
                leading: const Icon(Icons.person_2_sharp),
                title: const Text('pharmacy'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PharmacistPage(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
              const SizedBox(
                height: 200,
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
