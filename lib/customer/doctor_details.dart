import 'package:flutter/material.dart';

class DoctorDetails extends StatelessWidget {
    DoctorDetails({super.key ,required this.name, required this.adescription, required this.phone });
    
    final String name;
    final String adescription;
    final String phone;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/pro.JPG'),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Doctor Name ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(name,  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Phone Number",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(phone,  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
