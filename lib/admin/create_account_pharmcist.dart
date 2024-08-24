import 'package:flutter/material.dart';
import 'package:project/admin/home_screen_admin.dart';

class CreateAccountPharmcist extends StatefulWidget {
  const CreateAccountPharmcist({super.key});

  @override
  State<CreateAccountPharmcist> createState() => _CreateAccountPharmcistState();
}

class _CreateAccountPharmcistState extends State<CreateAccountPharmcist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('create account for Pharmacist', style: TextStyle(
          color: Colors.black
        )),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreenAdmin(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            
            children: [
              TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Name ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)
                        )
                  ),
                  ),
              
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  decoration: InputDecoration(
                   border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                   ),
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                  ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  decoration: InputDecoration(
                   border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                   ),
                    hintText: ' Password',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                  ),
             const SizedBox(
                height: 15,
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
