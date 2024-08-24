import 'package:flutter/material.dart';

class ResetPasswordDoctor extends StatefulWidget {
  const ResetPasswordDoctor({super.key});

  @override
  State<ResetPasswordDoctor> createState() => _ResetPasswordDoctorState();
}

class _ResetPasswordDoctorState extends State<ResetPasswordDoctor> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
         //Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Verification()) );
        },
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),

        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Reset Password', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
                SizedBox(
                 height: size.height/10,
                 ),
                   TextFormField(
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                      suffixIcon: const Icon(Icons.remove_red_eye,),                    ),
                    
                  ),
                      
                      SizedBox(
                      height: size.width/10,
    
                     ),
               
                                    InkWell(
                                      onTap: () {
                                       
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
                                           "verfiy",
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
                                      const Text('Did not Recieved Code?  ',),
                                       InkWell
                                       (
                                        onTap:() {
                                           //Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()) );
                                        },
                                        child: const Text('Resend',
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
    )
  ;
  }
}