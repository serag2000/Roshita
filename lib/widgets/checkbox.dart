
import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
   CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {

  String selectUser = 'medicine';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectUser,
      icon: Icon(Icons.menu),
      onChanged: (value) {
      setState(() {
        selectUser = value !;
      });
    },
    items:[
      DropdownMenuItem(
        value: 'medicine',
        child: Text('medicine'),
      
      ),
      DropdownMenuItem(
        value: 'medicine1',
        child: Text('medicine1'),
      
      ),
    
    DropdownMenuItem(
        value: 'medicine',
        child: Text('medicine1'),
      
      ),
    
    ] , 
    );
  }
}