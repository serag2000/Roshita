import 'package:flutter/material.dart';
import 'package:project/customer/forgetpassword/verification.dart';
import 'package:http/http.dart' as http;


class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  void resetPassword(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://192.168.66.48:8000/api/resetPassword'),
      body: {
        'email': emailController.text,
        'newPassword': newPasswordController.text,
      },
    );

    if (response.statusCode == 200) {
      // التعامل مع النجاح (مثل الانتقال إلى شاشة تسجيل الدخول)
      Navigator.popUntil(context, (route) => route.isFirst); // العودة إلى الشاشة الأولى
    } else {
      // التعامل مع الخطأ
    }}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const Verification()));
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),

        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reset Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 10,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      suffixIcon: const Icon(
                        Icons.remove_red_eye,
                      ),
                    ),
                    // validator: (value) {
                    //   if(value!.isEmpty){
                    //     return 'inter new password';
                    //   }
                    //   return null;
                      
                    // },
                  ),
                  SizedBox(
                    height: size.width / 20,
                  ),
                  TextFormField(
                    controller: newPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Confirm Your Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      suffixIcon: const Icon(
                        Icons.remove_red_eye,
                      ),
                    ),
                    // validator: (value) {
                    //   if(value!.isEmpty){
                    //     return 'Confirm Your Password';
                    //   }
                    //   return null;
                      
                    // },
                  ),
                   SizedBox(
                    height: size.width / 10,
                  ),
                  InkWell(
                    onTap: () async{
                      if(formKey.currentState!.validate())
                      {
                      //  return showDialog(context: context, builder: (context) => AlertDialog(
                      //   title:Column(children: [
                      //     Image.asset('assets/images/checkout.png',width: 150, height: 150),
                      //     const SizedBox(
                      //       height: 5,
                      //     ),
                      //     const Text('Password Reset'),
                      //     const SizedBox(
                      //       height: 10,
                      //     ),
                      //     const Text('Your password has been   ', style: TextStyle(
                      //       fontSize: 14
                      //     )),
                      //      const SizedBox(
                      //       height: 10,
                      //     ),
                      //     InkWell(
                      //       onTap: () {
                      //         Navigator.pop(context);
                      //       },
                      //       child: Container(
                      //                       width: size.width/1.1,
                      //                       height: size.width / 10,
                      //                       decoration: BoxDecoration(
                      //                         borderRadius: BorderRadius.circular(10),
                      //                         color: mainColor,
                      //                         border: Border.all(color: mainColor, width: 2),
                      //                       ),
                      //                       child: const Center(
                      //                         child: Text(
                      //       "Continue",
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         // fontWeight: FontWeight.bold,
                      //         color: backgroundScreenColor,
                      //       ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //     ),
                  
                      //   ])
                      // ));
                      resetPassword(context);
                      }
                      
                    },
                    child: Container(
                      width: double.infinity,
                      height: size.width / 9,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.blue, width: 2),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
// class ChickReset extends StatelessWidget {
//   const ChickReset({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Column(
//         children: [
//           InkWell(
//                     onTap: () async {
//                       showDialog(context: context, builder: (context) => AlertDialog(
//                         title:Column(children: [
//                           Image.asset('assets/images/checkout.png',width: 150, height: 150),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text('Order Success!'),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text('Your order has been placed successfully!  ', style: TextStyle(
//                             fontSize: 14
//                           )),
//                            SizedBox(
//                             height: 10,
//                           ),
//                           InkWell(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Container(
//                                             width: size.width/1.1,
//                                             height: size.width / 10,
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(10),
//                                               color: mainColor,
//                                               border: Border.all(color: mainColor, width: 2),
//                                             ),
//                                             child: const Center(
//                                               child: Text(
//                             "Done",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 14,
//                               // fontWeight: FontWeight.bold,
//                               color: backgroundScreenColor,
//                             ),
//                                               ),
//                                             ),
//                                           ),
//                           ),
                  
//                         ])
//                       ));
//                     },
//                    ),
//         ],
//       )
//            ,
//     );
//   }
// }
