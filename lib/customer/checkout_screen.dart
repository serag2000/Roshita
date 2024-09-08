
import 'package:flutter/material.dart';
import 'package:project/api/check_out.dart';
import 'package:project/customer/cart_screen.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/customer/orders_screen.dart';
import 'package:project/models/show_cart.dart';

import '../helper/const.dart';

class CheckoutScreen extends StatefulWidget {
  final  List<CartItem> data;
  late double total;
   CheckoutScreen({super.key,required this.data,required this.total});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

late String token;
TextEditingController phone = TextEditingController();
TextEditingController address = TextEditingController();
bool isLoading = false;

void alert({required BuildContext context, required Size size,required double total}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
              title: Column(children: [
            Image.asset('assets/images/checkout.png', width: 150, height: 150),
            const SizedBox(
              height: 5,
            ),
            const Text('Order Success!'),
            const SizedBox(
              height: 10,
            ),
            const Text('Your order has been placed successfully!  ',
                style: TextStyle(fontSize: 14)),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  OrderScreen(data: data,total: total),
                    ));
              },
              child: Container(
                width: size.width / 1.1,
                height: size.width / 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: mainColor,
                  border: Border.all(color: mainColor, width: 2),
                ),
                child: const Center(
                  child: Text(
                    "show invoice",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.bold,
                      color: backgroundScreenColor,
                    ),
                  ),
                ),
              ),
            ),
          ])));
}

Future<void> submitCheckOut(
    {required BuildContext context, required Size size, required double total}) async {
      try{
  isLoading = true;
  int code =
      await CeckOutApi.checkOut(Phone: phone.text, address: address.text);
  if (code == 200 || code == 201) {
    alert(context: context, size: size,total: total);
    phone.clear();
    address.clear();
  } else {
     alertFaild(context: context,size: size);
  }
  isLoading = false;
      }catch(e){
       alertFaild(context: context,size: size);
      }
      isLoading = false;
}



  void alertFaild({required BuildContext context, required Size size}) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                  title: Column(children: [
                Image.asset('assets/images/error.png', width: 150, height: 150),
                const SizedBox(
                  height: 5,
                ),
                const Text('Error!'),
                const SizedBox(
                  height: 10,
                ),
                const Text('Your order has been Faild !  ',
                    style: TextStyle(fontSize: 14)),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: size.width / 1.1,
                    height: size.width / 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mainColor,
                      border: Border.all(color: mainColor, width: 2),
                    ),
                    child: const Center(
                      child: Text(
                        "show invoice",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                          color: backgroundScreenColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ])));
      }

class _CheckoutScreenState extends State<CheckoutScreen> {
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Checkout',
            style: TextStyle(
              color: Colors.black,
            )),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Receipt',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.width / 20,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                         itemCount: widget.data.length,
                       itemBuilder: (context, index) =>  Row(
                        children: [
                          Image.asset(
                            'assets/images/Dw.png',
                            width: 100,
                            height: 100,
                          ),
                           Text(widget.data[index].productTitle,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                                  SizedBox(
                                    width: 8,
                                  ),
                           Text("${widget.data[index].total}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                   
                  ),
              ),
              SizedBox(
                height: size.width / 10,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${widget.total} LYD',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width / 20,
              ),
              Container(
                height: 1,
                color: Colors.grey[300],
              ),
              const Text(
                'Checkout Details',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: address,
                decoration: const InputDecoration(
                  label: Text('address'),
                ),
              ),
              TextFormField(
                controller: phone,
                decoration: const InputDecoration(
                  label: Text('Phone Number'),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 180,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Card Number'),
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Confirmation Number'),
                ),
              ),
              SizedBox(
                height: size.width / 20,
              ),
              InkWell(
                onTap: () async {
                  if (phone.text.isEmpty || address.text.isEmpty) {
                    mySnackBarBack(
                        context, 'Please input your Address and your Phone ');
                  } else {
                    submitCheckOut(context: context, size: size,total: widget.total);
                  }
                },
                child: Container(
                  width: size.width / 1.1,
                  height: size.width / 6.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mainColor,
                    border: Border.all(color: mainColor, width: 2),
                  ),
                  child: islogin?Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ): Center(
                    child: Text(
                      "Confirm Checkout",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                        color: backgroundScreenColor,
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

// class Receipt extends StatefulWidget {
//   const Receipt({super.key});

//   @override
//   State<Receipt> createState() => _ReceiptState();
// }

// class _ReceiptState extends State<Receipt> {
//   @override
//   void initState() {
//     show();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         FutureBuilder(
//             future: show(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     return Row(
//                       children: [
//                         Image.asset(
//                           'assets/images/Dw.png',
//                           width: 100,
//                           height: 100,
//                         ),
//                          Text("${snapshot.data![index].productTitle}",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 14)),
//                          Text("${snapshot.data![index].total}",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 14)),
//                       ],
//                     );
//                   },
                  
//                 );
//               }else {
//                       return  SizedBox(
//                         height: size.height*0.65,
//                         child:const Center(
//                           child:   CircularProgressIndicator(
//                             color: Colors.black,
//                           ),
//                         ),
//                       );
//                     }
//             }),
//         Container(
//           height: 1,
//           color: Colors.grey[350],
//           width: size.width / 1.5,
//         ),
//       ],
//     );
//   }
// }
