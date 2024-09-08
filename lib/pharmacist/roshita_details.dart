import 'package:flutter/material.dart';

class RoshitaDetails extends StatefulWidget {
  const RoshitaDetails({super.key});

  @override
  State<RoshitaDetails> createState() => _RoshitaDetailsState();
}

class _RoshitaDetailsState extends State<RoshitaDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('user name '),
                    SizedBox(
                      width: 120,
                    ),
                    Text('Birth Day '),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text('doctors name '),
                    SizedBox(
                      width: 120,
                    ),
                    Text('تخصص '),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text('user email '),
                    SizedBox(
                      width: 120,
                    ),
                    Text('Birth Day '),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text('user email '),
                    SizedBox(
                      width: 120,
                    ),
                    Text('Birth Day '),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
