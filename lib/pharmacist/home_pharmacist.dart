import 'package:flutter/material.dart';
import 'package:project/customer/loading.dart';
import 'package:project/pharmacist/login_pharmacist.dart';
import 'package:project/pharmacist/pharmacist_proflie.dart';

class HomePharmacist extends StatefulWidget {
  const HomePharmacist({super.key});

  @override
  State<HomePharmacist> createState() => _HomePharmacistState();
}

class _HomePharmacistState extends State<HomePharmacist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilepharmacistScreen(),));
        }, icon: Icon(Icons.person), color: Colors.blue,)],
        title: const Text('Pharmacist', style: TextStyle(
          color: Colors.black
        )),
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
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
               leading: const Icon(Icons.logout),
                title: const Text('Log out'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Loading(),));
                },
            )
          ],
        ),
      ),
      
      body: InkWell(
        onTap: () {
          
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
             borderRadius: BorderRadius.circular(20) 
              
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('user name: '),
                  SizedBox(
                    height: 13,
                  ),
                  Text('Doctor name'),
                   SizedBox(
                    height: 13,
                  ),
                  Text('Specialization '),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}