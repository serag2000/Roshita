
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:project/admin/home_screen_admin.dart';


import '../widgets/image_screen.dart';


class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final List<String> items = [
    'Item1 111111111111111111111111',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const HomeScreenAdmin(),));
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0,
        title: const Text('Add Products',
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
                  suffixIcon: DropdownButton2(
                                   isExpanded: true,
                                items: items
                                    .map((String item) =>
                                        DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                               value: selectedValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  height: 55,
                                  width: 140,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                    label: const Text('choose Category '),
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
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Column(
                          children: [
                            const Text(' the product has been added successfull ',  ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.check_box, color: Colors.green),
                                const SizedBox(
                                  width: 150,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue)),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel',
                                          style: TextStyle(
                                            color: Colors.blue,
                                          )),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ));
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
