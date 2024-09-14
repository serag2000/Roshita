// import 'dart:convert';

// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:project/admin/home_screen_admin.dart';
// import 'package:project/api/product_control.dart';
// import 'package:project/customer/login_screen.dart';
// import 'package:project/doctor/profile_doctor_screen.dart';
// import 'package:project/models/admin_model/all_categorys.dart';
// import 'package:project/models/admin_model/all_productsAdmine.dart';

// import '../widgets/image_screen.dart';

// class AddProduct extends StatefulWidget {
//   AddProduct({super.key}) {
//     canEdit = false;
//   }

//   int selectedCategoreyId = 0;
//   int ?id;
//   late bool canEdit;
//   List <AllCategory> categories = [];
//   AddProduct.edit({required ProductControl data}) {
//     title.text = data.title;
//     description.text = data.description;
//     price.text = data.price.toString();
//     qtyInStock.text = data.qtyInStock.toString();
//     imgUrl1.text = data.imgUrl1;
//     categoryId.text = data.categoryId.toString();
//     parcode.text = data.parcode;
//     id = data.id;
//     canEdit = true;
//   }

//   TextEditingController title = TextEditingController();
//   TextEditingController description = TextEditingController();
//   TextEditingController price = TextEditingController();
//   TextEditingController qtyInStock = TextEditingController();
//   TextEditingController imgUrl1 = TextEditingController();
//   TextEditingController categoryId = TextEditingController();
//   TextEditingController parcode = TextEditingController();

//   @override
//   State<AddProduct> createState() => _AddProductState();
// }

// class _AddProductState extends State<AddProduct> {
//   bool isLoading = false;

//   clearProduct() {
//     widget.title.clear();
//     widget.description.clear();
//     widget.price.clear();
//     widget.qtyInStock.clear();
//     widget.imgUrl1.clear();
//     widget.categoryId.clear();
//     widget.parcode.clear();
//   }

//   CreateProductApi _api = CreateProductApi();

//   create({required BuildContext context}) async {
//    setState(() {
//       isLoading = true;
//     });
//     try {
//       var response = await _api.addToProduct(
//           title: widget.title.text,
//           description: widget.description.text,
//           price: widget.price.text,
//           qtyInStock: widget.qtyInStock.text,
//           imgUrl1: widget.imgUrl1.text,
//           categoryId: widget.selectedCategoreyId.toString(),  // هنا نقوم بتحويل المعرف إلى نص
//           parcode: widget.parcode.text,
//           url: 'api/adminAuth/product');

//       var result = jsonDecode(response.body);
//       mySnackBarBack(context, result['message']);
//       if (response.statusCode == 200) {
//         clearProduct();
//       }
//     } catch (e) {
//       mySnackBarBack(context, e.toString());
//       if (kDebugMode) {
//         print("eror: " + e.toString());
//       }
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }

//   Future  <void>showCategorey() async {
//     setState(() {
//       isLoading =true;
//     });
//   // isLoading = true;
//   try {
//     var response = await _api.getCategorey('api/adminAuth/category');
//     var result = jsonDecode(response.body)['data'];
//     if (kDebugMode) {
//       print(result);
//       print(result.runtimeType);
//     }
//     if (response.statusCode == 200) {
//          widget.categories = result
//           .map<AllCategory>((item) => AllCategory.fromJson(item))
//           .toList();

//       if (kDebugMode) {
//         print("data:" + result);
//         // print("dddd ${jsonDecode(response.body)['data']}");
//         // print("res: $result");
//         // print("resultssss ===> ${data}");
//       }

//       // await prefs.setBool('islogin', true);
//       // await prefs.setString('token', result['access_token']);
//       // // ignore: use_build_context_synchronously

//       // setCoins(data);
//     } else {
//       if (kDebugMode) {
//         print("response.statusCode ===> ${response.statusCode}");
//         print("data ====> $data");
//       }
//       if (kDebugMode) {
//         print("response ===> ${response.body}");
//       }
//       // ignore: use_build_context_synchronously
//       // mySnackBarBack(context, result["error"]);
//     // return result;
//       // await prefs.setBool('islogin', false);
//     }
//   } catch (e) {

//    if (kDebugMode) {
//      print('=================================================');
//      print(e.toString());
//    }
//   }
//   setState(() {
//     isLoading =false;
//   });

// }

//   Future<void> editProduct({
//     required BuildContext context,
//   }) async {
//     try {
//       setState(() {
//         isLoading = true;
//       });
//       var response = await _api.putProduct(
//         url: 'api/adminAuth/product/${widget.id}',
//         // title: widget.title.text,
//         title: widget.title.text,
//         description: widget.description.text,
//         price: widget.price.text,
//         qtyInStock: widget.qtyInStock.text,
//         imgUrl1: widget.imgUrl1.text,
//         categoryId: widget.categoryId.text,
//         parcode: widget.parcode.text,
//       );
//       if (kDebugMode) {
//         print(response.body);
//       }
//       var result = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         mySnackBarBack(context, 'done');
//         widget.canEdit = false;
//         clearProduct();
//       }
//     } catch (e) {
//       mySnackBarBack(context, e.toString());
//     }
//     setState(() {
//       isLoading = false;
//     });

//     // ignore: use_build_context_synchronously
//     // mySnackBarBack(context, result["error"]);

//     // await prefs.setBool('islogin', false);
//   }

//   Future<void> removeProduct({required BuildContext context}) async {
//     try {
//       setState(() {
//         isLoading = true;
//       });
//       var response = await _api.removeProduct(
//         url: 'api/adminAuth/product/${widget.id}',
//       );
//       if (kDebugMode) {
//         print(response.body);
//       }
//       var result = jsonDecode(response.body);
//       mySnackBarBack(context, 'done');
//       widget.canEdit = false;
//       clearProduct();
//     } catch (e) {
//       mySnackBarBack(context, e.toString());
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }

//   void showBottomSheet({required BuildContext context}){

//      showModalBottomSheet(
//     context: context,
//     builder: (context) => isLoading
//         ? const Center(child: CircularProgressIndicator())
//         : ListView.separated(
//             itemBuilder: (context, index) => InkWell(
//               onTap: () {
//                 widget.selectedCategoreyId = widget.categories[index].id; // تعيين المعرف المحدد
//                 widget.categoryId.text = widget.categories[index].name;  // تعيين الاسم كقيمة نصية
//                 Navigator.pop(context);
//               },
//               child: Text(
//                 widget.categories[index].name,
//                 style: TextStyle(color: Colors.green),
//               ),
//             ),
//             itemCount: widget.categories.length,
//             separatorBuilder: (context, index) => SizedBox(height: 6),
//           ),
//   );
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const HomeScreenAdmin(),
//                   ));
//             },
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             )),
//         elevation: 0,
//         title: const Text('Add Products',
//             style: TextStyle(
//               color: Colors.black,
//             )),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: widget.title,
//                 decoration: InputDecoration(
//                     enabledBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue)),
//                     label: const Text('Product Name'),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     )),
//               ),
//               SizedBox(
//                 height: size.width / 30,
//               ),
//               TextFormField(
//                 controller: widget.qtyInStock,
//                 decoration: InputDecoration(
//                     enabledBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue)),
//                     label: const Text('qtyInStock'),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     )),
//               ),
//               SizedBox(
//                 height: size.width / 30,
//               ),
//               TextFormField(
//                 controller: widget.price,
//                 decoration: InputDecoration(
//                     enabledBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue)),
//                     label: const Text('Product Price'),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     )),
//               ),
//               SizedBox(
//                 height: size.width / 30,
//               ),
//               TextFormField(
//                 readOnly: true,
//                 onTap: (){
//                   setState(() {
//                     showCategorey();
//                   showBottomSheet(context: context);
//                   });

//                 },
//                 controller: widget.categoryId,
//                 decoration: InputDecoration(
//                     enabledBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue)),
//                     label: const Text('choose Category '),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     )),
//               ),
//               SizedBox(
//                 height: size.width / 30,
//               ),
//               SizedBox(
//                 height: size.width / 30,
//               ),
//               TextFormField(
//                 controller: widget.parcode,
//                 decoration: InputDecoration(
//                     enabledBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue)),
//                     label: const Text('parcode'),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     )),
//               ),
//               SizedBox(
//                 height: size.width / 30,
//               ),
//               TextFormField(
//                 controller: widget.description,
//                 decoration: InputDecoration(
//                     label: const Text('Description'),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     )),
//               ),
//               SizedBox(
//                 height: size.width / 10,
//               ),
//               const Text(
//                 'Add Picture',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: size.width / 20,
//               ),
//               const Divider(
//                 height: 1,
//                 color: Colors.blue,
//               ),
//               const SizedBox(height: 150, child: ImageScreen()),
//               SizedBox(
//                 height: size.width / 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: InkWell(
//                   onTap: () {
//                     widget.canEdit
//                         ? editProduct(context: context)
//                         : create(context: context);
//                   },
//                   child: isLoading
//                       ? const Center(
//                           child: CircularProgressIndicator(),
//                         )
//                       : Container(
//                           width: double.infinity,
//                           height: size.width / 11,
//                           decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(5),
//                             border: Border.all(color: Colors.blue, width: 1),
//                           ),
//                           child: Center(
//                             child: Text(
//                               widget.canEdit ? 'Edit' : "Save",
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: InkWell(
//                   onTap: () {
//                     removeProduct(context: context);
//                   },
//                   child: Visibility(
//                     visible: canEdit && isLoading == false,
//                     child: Container(
//                       width: double.infinity,
//                       height: size.width / 11,
//                       decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(color: Colors.blue, width: 1),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'Delete',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// // Padding(
// //                 padding: const EdgeInsets.all(10.0),
// //                 child: InkWell(
// //                   onTap: () {
// //                     // showDialog(
// //                     //     context: context,
// //                     //     builder: (context) => AlertDialog(
// //                     //           title: Column(
// //                     //             children: [
// //                     //               const Text(
// //                     //                 ' the product has been added successfull ',
// //                     //               ),
// //                     //               const SizedBox(
// //                     //                 height: 50,
// //                     //               ),
// //                     //               Row(
// //                     //                 children: [
// //                     //                   const Icon(Icons.check_box,
// //                     //                       color: Colors.green),
// //                     //                   const SizedBox(
// //                     //                     width: 150,
// //                     //                   ),
// //                     //                   Container(
// //                     //                       decoration: BoxDecoration(
// //                     //                           border: Border.all(
// //                     //                               color: Colors.blue)),
// //                     //                       child: MaterialButton(
// //                     //                         onPressed: () {
// //                     //                           Navigator.pop(context);
// //                     //                         },
// //                     //                         child: const Text('Cancel',
// //                     //                             style: TextStyle(
// //                     //                               color: Colors.blue,
// //                     //                             )),
// //                     //                       )),
// //                     //                 ],
// //                     //               ),
// //                     //             ],
// //                     //           ),
// //                     //         ));
// //                   },
// //                   child: Container(
// //                     width: double.infinity,
// //                     height: size.width / 11,
// //                     decoration: BoxDecoration(
// //                       color: Colors.blue,
// //                       borderRadius: BorderRadius.circular(5),
// //                       border: Border.all(color: Colors.blue, width: 1),
// //                     ),
// //                     child: const Center(
// //                       child: Text(
// //                         "Save",
// //                         style: TextStyle(
// //                           fontSize: 14,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/admin/home_screen_admin.dart';
import 'package:project/api/product_control.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/models/admin_model/all_categorys.dart';
import 'package:project/models/admin_model/all_productsAdmine.dart';


class AddProduct extends StatefulWidget {
  AddProduct({super.key}) {
    canEdit = false;
  }

  int selectedCategoreyId =0;
  int? id;
  late bool canEdit;
  List<AllCategory> categories = [];
  AddProduct.edit({super.key, required ProductControl data}) {
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

  final CreateProductApi _api = CreateProductApi();

  create({required BuildContext context}) async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _api.addToProduct(
          title: widget.title.text,
          description: widget.description.text,
          price: double.parse(widget.price.text),
          qtyInStock: widget.qtyInStock.text,
          imgUrl1: widget.imgUrl1.text,
          categoryId: widget.selectedCategoreyId,
          parcode: widget.parcode.text,
          url: 'api/adminAuth/product');

      var result = jsonDecode(response.body);
      // ignore: use_build_context_synchronously
      mySnackBarBack(context, result['message']);
      if (response.statusCode == 200) {
        clearProduct();
        
      }
      if (kDebugMode) {
          print(response.body);
        }
    } catch (e) {
      // ignore: use_build_context_synchronously
      mySnackBarBack(context, e.toString());
      if (kDebugMode) {
        print("error: " + e.toString());
      }
    }
    setState(() {
      isLoading = false;
    });
  }
   
  Future<List<AllCategory>> showCategorey() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _api.getCategorey('api/adminAuth/category');
      var result = jsonDecode(response.body);

      // Ensure 'data' is a list of categories
      if (result['data'] is List) {
        List<AllCategory> categories = (result['data'] as List)
            .map<AllCategory>((item) => AllCategory.fromJson(item))
            .toList();

        if (kDebugMode) {
          print(categories.map((cat) => cat.toString()).join(', '));
        }

        // Update the widget's categories
        widget.categories = categories;

        // Return the categories
        return categories;
      } else {
        // Handle the case where 'data' is not a list
        if (kDebugMode) {
          print(
              'Error: Expected data to be a list but got ${result['data'].runtimeType}');
        }
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return [];
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> editProduct({required BuildContext context}) async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await _api.putProduct(
        url: 'api/adminAuth/product/${widget.id}',
        title: widget.title.text,
        description: widget.description.text,
        price: widget.price.text,
        qtyInStock: widget.qtyInStock.text,
        imgUrl1: widget.imgUrl1.text,
        categoryId: widget.selectedCategoreyId.toString(),
        parcode: widget.parcode.text,
      );
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        mySnackBarBack(context, 'Done');
        widget.canEdit = false;
        clearProduct();
      }
    } catch (e) {
      mySnackBarBack(context, e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> removeProduct({required BuildContext context}) async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await _api.removeProduct(
        url: 'api/adminAuth/product/${widget.id}',
      );
      var result = jsonDecode(response.body);
      mySnackBarBack(context, 'Done');
      widget.canEdit = false;
      clearProduct();
    } catch (e) {
      mySnackBarBack(context, e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  void showBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        // Display a loading indicator if data is still loading
        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // Check if categories list is not empty
        if (widget.categories.isEmpty) {
          return const Center(child: Text('No categories available.'));
        }

        // Display the list of categories
        return ListView.separated(
          itemCount: widget.categories.length,
          itemBuilder: (context, index) {
            final category = widget.categories[index];
            return InkWell(
              onTap: () {
                // Update selected category ID and text field
                setState(() {
                  
                  widget.selectedCategoreyId = category.id;
                  widget.categoryId.text = category.name;
                });
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 16.0),
                child: Text(
                  category.name,
                  style: const TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(height: 1),
        );
      },
    );
  }

  void _onCategoryTap(BuildContext context) async {
    // Fetch categories before showing bottom sheet
    await showCategorey();

    // Show the bottom sheet after categories are loaded
    showBottomSheet(context: context);
  }

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
                    label: const Text('Qty In Stock'),
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
                readOnly: true,
                onTap: () => _onCategoryTap(context),
                controller: widget.categoryId,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  label: const Text('Choose Category'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: size.width / 30,
              ),
              TextFormField(
                controller: widget.parcode,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    label: const Text('Parcode'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: size.width / 30,
              ),
              TextFormField(
                controller: widget.imgUrl1,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    label: const Text('Image URL'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: size.width / 20,
              ),
              TextFormField(
                controller: widget.description,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    label: const Text('description'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: size.width / 20,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: size.width / 7,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width / 2, size.width / 8)),
                  onPressed: () async {
                    widget.canEdit
                        ? await editProduct(context: context)
                        : await create(context: context);
                  },
                  child: widget.canEdit
                      ? const Text('Edit Product')
                      : const Text('Add Product'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (widget.canEdit)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      fixedSize: Size(size.width / 2, size.width / 8)),
                  onPressed: () async {
                    await removeProduct(context: context);
                  },
                  child: const Text('Remove Product'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
