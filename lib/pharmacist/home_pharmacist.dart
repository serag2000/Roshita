import 'package:flutter/material.dart';
import 'package:project/pharmacist/login_pharmacist.dart';

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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPharmacist(),));
                },
            )
          ],
        ),
      ),
      
      body: Center(
        child: InkWell(
          onTap: () {
            
          },
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue)
              
            ),
            child: const Center(child: Text('Show Roshita')),
          ),
        ),
      ),
    );
  }
}