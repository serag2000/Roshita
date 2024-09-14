
import 'package:flutter/material.dart';

import '../widgets/image_screen.dart';


class Modifyscreen extends StatefulWidget {
  const Modifyscreen({super.key});

  @override
  State<Modifyscreen> createState() => _ModifyscreenState();
}

class _ModifyscreenState extends State<Modifyscreen> {
 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0,
        title: const Text('Modify Product',
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                    label: const Text('Product Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: size.width / 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                    label: const Text('Product Price'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: size.width / 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                    label: const Text('Choose Category'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: size.width / 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                    label: const Text('Description'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: size.width / 10,
              ),
              const Text(
                'Add Picture',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.width / 20,
              ),
              const Divider(
                height: 1,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 150,
                child: ImageScreen()),
                 const SizedBox(
                  height: 150,
                ),
                Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: double.infinity,
                    height: size.width / 11,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.blue, width: 1),
                    ),
                    child: const Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
