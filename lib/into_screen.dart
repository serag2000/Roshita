import 'package:flutter/material.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/doctor/login_doctor.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Please select your role',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: size.width / 10,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 2.5,
                      color: Colors.blue,
                    ),
                  ),
                  child: const Center(
                    child: Text('Guest',
                        style: TextStyle(
                          color: Colors.blue,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: size.width / 35,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const LoginScreen(),));
                },
                child: Container(
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 2.5,
                      color: Colors.blue,
                    ),
                  ),
                  child: const Center(
                    child: Text('Customer',
                        style: TextStyle(
                          color: Colors.blue,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: size.width / 35,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const LoginDoctor(),));
                },
                child: Container(
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 2.5,
                      color: Colors.blue,
                    ),
                  ),
                  child: const Center(
                    child: Text('Doctor',
                        style: TextStyle(
                          color: Colors.blue,
                        )),
                  ),
                ),
              ),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       TextButton(onPressed: (){}, child: Text('Skip' , style: TextStyle( fontSize: 20),)),
            //       ElevatedButton(onPressed: (){}, child: Text('Next'))
            //     ],
            //   ),
             ],
          ),
        ),
      ),
      floatingActionButton:   Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(onPressed: (){}, child: const Text('Skip' , style: TextStyle( fontSize: 20),)),
                  ElevatedButton(onPressed: (){}, child: const Text('Next'))
                ],
              ),
            
    );
  }
}
