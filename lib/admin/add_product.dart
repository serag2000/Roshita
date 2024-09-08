import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/admin/home_screen_admin.dart';
import 'package:project/api/product_control.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/doctor/profile_doctor_screen.dart';
import 'package:project/models/admin_model/all_productsAdmine.dart';

import '../widgets/image_screen.dart';

class AddProduct extends StatefulWidget {
  AddProduct({super.key}) {
    canEdit = false;
  }

  int? id;
  late bool canEdit;
  AddProduct.edit({required ProductControl data}) {
    title.text = data.title;
    description.text = data.description;
    price.text = data.price.toString();
    qtyInStock.text = data.qtyInStock.toString();
    imgUrl1.text = data.imgUrl1;
    categoryId.text = data.categoryId.toString();
    parcode.text = data.parcode;
    id = data.id;
    canEdit = true;
  }

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController qtyInStock = TextEditingController();
  TextEditingController imgUrl1 = TextEditingController();
  TextEditingController categoryId = TextEditingController();
  TextEditingController parcode = TextEditingController();

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool isLoading = false;

  clearProduct() {
    widget.title.clear();
    widget.description.clear();
    widget.price.clear();
    widget.qtyInStock.clear();
    widget.imgUrl1.clear();
    widget.categoryId.clear();
    widget.parcode.clear();
  }

  CreateProductApi _api = CreateProductApi();

  create({required BuildContext context}) async {
   setState(() {
      isLoading = true;
    });
    try {
      var response = await _api.addToProduct(
          // title: widget.title.text,
          title: widget.title.text,
          description: widget.description.text,
          price: widget.price.text,
          qtyInStock: widget.qtyInStock.text,
          imgUrl1: widget.imgUrl1.text,
          categoryId: widget.categoryId.text,
          parcode: widget.parcode.text,
          url: 'api/adminAuth/product');

      var result = jsonDecode(response.body);
      mySnackBarBack(context, result['message']);
      if (response.statusCode == 200) {
        clearProduct();
      }
    } catch (e) {
      mySnackBarBack(context, e.toString());
      if (kDebugMode) {
        print("eror: " + e.toString());
      }
    }
    setState(() {
      isLoading = false;
    });


  }

  Future<void> editProduct({
    required BuildContext context,
  }) async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await _api.putProduct(
        url: 'api/adminAuth/product/${widget.id}',
        // title: widget.title.text,
        title: widget.title.text,
        description: widget.description.text,
        price: widget.price.text,
        qtyInStock: widget.qtyInStock.text,
        imgUrl1: widget.imgUrl1.text,
        categoryId: widget.categoryId.text,
        parcode: widget.parcode.text,
      );
      if (kDebugMode) {
        print(response.body);
      }
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        mySnackBarBack(context, 'done');
        widget.canEdit = false;
        clearProduct();
      }
    } catch (e) {
      mySnackBarBack(context, e.toString());
    }
    setState(() {
      isLoading = false;
    });

    // ignore: use_build_context_synchronously
    // mySnackBarBack(context, result["error"]);

    // await prefs.setBool('islogin', false);
  }

  Future<void> removeProduct({required BuildContext context}) async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await _api.removeProduct(
        url: 'api/adminAuth/product/${widget.id}',
      );
      if (kDebugMode) {
        print(response.body);
      }
      var result = jsonDecode(response.body);
      mySnackBarBack(context, 'done');
      widget.canEdit = false;
      clearProduct();
    } catch (e) {
      mySnackBarBack(context, e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  
  final List<String> items = [
    '1',
    '2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                controller: widget.title,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    label: const Text('Product Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: size.width / 30,
              ),
              TextFormField(
                controller: widget.qtyInStock,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    label: const Text('qtyInStock'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: size.width / 30,
              ),
              TextFormField(
                controller: widget.price,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    label: const Text('Product Price'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: size.width / 30,
              ),
              TextFormField(
                controller: widget.categoryId,
                decoration: InputDecoration(
                    suffixIcon: DropdownButton2(
                      isExpanded: true,
                      items: items
                          .map((String item) => DropdownMenuItem(
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
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    label: const Text('choose Category '),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: size.width / 30,
              ),
              SizedBox(
                height: size.width / 30,
              ),
              TextFormField(
                controller: widget.parcode,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    label: const Text('parcode'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: size.width / 30,
              ),
              TextFormField(
                controller: widget.description,
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
              const SizedBox(height: 150, child: ImageScreen()),
              SizedBox(
                height: size.width / 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    widget.canEdit
                        ? editProduct(context: context)
                        : create(context: context);
                  },
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          width: double.infinity,
                          height: size.width / 11,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.blue, width: 1),
                          ),
                          child: Center(
                            child: Text(
                              widget.canEdit ? 'Edit' : "Save",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    removeProduct(context: context);
                  },
                  child: Visibility(
                    visible: canEdit && isLoading == false,
                    child: Container(
                      width: double.infinity,
                      height: size.width / 11,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.blue, width: 1),
                      ),
                      child: Center(
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
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
// Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: InkWell(
//                   onTap: () {
//                     // showDialog(
//                     //     context: context,
//                     //     builder: (context) => AlertDialog(
//                     //           title: Column(
//                     //             children: [
//                     //               const Text(
//                     //                 ' the product has been added successfull ',
//                     //               ),
//                     //               const SizedBox(
//                     //                 height: 50,
//                     //               ),
//                     //               Row(
//                     //                 children: [
//                     //                   const Icon(Icons.check_box,
//                     //                       color: Colors.green),
//                     //                   const SizedBox(
//                     //                     width: 150,
//                     //                   ),
//                     //                   Container(
//                     //                       decoration: BoxDecoration(
//                     //                           border: Border.all(
//                     //                               color: Colors.blue)),
//                     //                       child: MaterialButton(
//                     //                         onPressed: () {
//                     //                           Navigator.pop(context);
//                     //                         },
//                     //                         child: const Text('Cancel',
//                     //                             style: TextStyle(
//                     //                               color: Colors.blue,
//                     //                             )),
//                     //                       )),
//                     //                 ],
//                     //               ),
//                     //             ],
//                     //           ),
//                     //         ));
//                   },
//                   child: Container(
//                     width: double.infinity,
//                     height: size.width / 11,
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(5),
//                       border: Border.all(color: Colors.blue, width: 1),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         "Save",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
            