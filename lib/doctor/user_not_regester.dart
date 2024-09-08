import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserNotRegester extends StatefulWidget {
  const UserNotRegester({super.key});

  @override
  State<UserNotRegester> createState() => _UserNotRegesterState();
}

class _UserNotRegesterState extends State<UserNotRegester> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Roshita.png', width: 150),
          Text('Please Inter Your Email', style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20
          )),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(

              decoration: InputDecoration(
                labelText: 'Enter The User Email',
                hintText: 'Email',
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue), borderRadius: BorderRadius.circular(15)),
                border: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(15)
                )

              ),
            ),
          ),
        ],
      ),
    );
  }
}