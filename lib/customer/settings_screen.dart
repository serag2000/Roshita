import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: Text('Settings', style: TextStyle(
          color: Colors.black,
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Profile', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
                IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right_sharp, size: 30,)),
              ],
              
            ),
            Container(
                  height: 1,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: size.width/40,
                ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Change Language', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
                IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right_sharp, size: 30,)),
              ],
              
            ),
            Container(
                  height: 1,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: size.width/40,
                ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Change Password', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
                IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right_sharp, size: 30,)),
              ],
              
            ),
            Container(
                  height: 1,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: size.width/40,
                ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('About Us', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
                IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right_sharp, size: 30,)),
              ],
              
            ),
            Container(
                  height: 1,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: size.width/40,
                ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Log Out', style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue[300],
                  fontWeight: FontWeight.bold,
                )),
                IconButton(onPressed: (){}, icon: Icon(Icons.logout, size: 30,)),
              ],
              
            ),
            Container(
                  height: 1,
                  color: Colors.blue,
                ),
          
          
          ],
        ),
      ),
    );
  }
}