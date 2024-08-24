import 'package:flutter/material.dart';
import 'package:project/doctor/login_doctor.dart';
class CreateAccountDoctor extends StatefulWidget {
  const CreateAccountDoctor({super.key});

  @override
  State<CreateAccountDoctor> createState() => _CreateAccountDoctorState();
}

class _CreateAccountDoctorState extends State<CreateAccountDoctor> {
final  formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        title: const Text('Create Account',style: TextStyle(color: Colors.black)),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                    TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                    ),
                    validator: (value) {
                      if(value!.length>=2)
                      {
                        return null;
                      }
                      else{
                        return 'Enter Your Name';
                      }
                    },
                  ),
                   SizedBox(
                    height: size.width/20,
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
                    height: size.width/20,
                   ),
             
                   TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                    ),
                    validator: (data){
                          if(data !.isEmpty){
                            return 'inter your number';
                          }
                          final regexp = RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$'
);
                          if(!regexp.hasMatch(data)){
                            return ' Inter your Securty';
                          }
                          return null;
                    }
                  ),
                   SizedBox(
                    height: size.width/20,
                   ),
                   
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                    ),
                    validator: (value) {
                      if(value!.length>=2)
                      {
                        return null;
                      }
                      else{
                        return 'Enter Your Name';
                      }
                    },
                  ),
                    SizedBox(
                    height: size.width/6,
                   ),
             
                                  InkWell(
                                    onTap: () {
                                     if(formKey.currentState!.validate()){
                                      
                                    }
                                    },
                                    child: Container(
                                     width: 350,
                                     height: size.width / 9,
                                     decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.blue, width: 2),
                                                       ),
                                     child: const Center(
                                       child: Text(
                                         "Create Account",
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
                                      child: const Text('Log in',
                                      style: TextStyle(
                                        color: Colors.blue
                                      ),
                                      )),
                                    
                          ],
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