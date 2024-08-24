import 'package:flutter/material.dart';
import 'package:project/doctor/login_doctor.dart';
import 'package:project/doctor/verification_doctor.dart';

class ForgetPasswordDoctor extends StatefulWidget {
  const ForgetPasswordDoctor({super.key});

  @override
  State<ForgetPasswordDoctor> createState() => _ForgetPasswordDoctorState();
}

class _ForgetPasswordDoctorState extends State<ForgetPasswordDoctor> {
  final forkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: Colors.black),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginDoctor()) );
        },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: forkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Forget Password', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
                SizedBox(
                 height: size.height/30,
                 ),
                const Text('please enter the email address linked with your account'),
                 SizedBox(
                 height: size.height/9,
                 ),
                       TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border:OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                      ),
                      validator: (data){
                            if(data !.isEmpty){
                              return 'this field is required';
                            }
                            final regexp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                            if(!regexp.hasMatch(data)){
                              return ' Inter your Securty';
                            }
                            return null;
                      }
                    ),
                      SizedBox(
                      height: size.width/10,
          
                     ),
               
                                    InkWell(
                                      onTap: () {
                                        if(forkey.currentState!.validate()){
                                          Navigator.push(context, MaterialPageRoute(builder: (_) => const VerificationDoctor()) );
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
                                           "Send Code",
                                           style: TextStyle(
                                             fontSize: 14,
                                            color: Colors.white,
                                           ),
                                           ),
                                       ),
                                   ),
                                    ), 
                                       SizedBox(
                                          height: size.width/30,
                                         ),
                                    Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Already Have An Account?  ',),
                                       InkWell
                                       (
                                        onTap:() {
                                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginDoctor()) );
                                        },
                                        child: const Text('Log in Now',
                                        style: TextStyle(
                                          color: Colors.blue
                                        ),
                                        )),
                                      
                            ],
                          )
              ],
            ),
          ),
        ),
      ));
  }
}