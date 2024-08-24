import 'package:flutter/material.dart';

class AboutusScreen extends StatefulWidget {
  const AboutusScreen({super.key});

  @override
  State<AboutusScreen> createState() => _AboutusScreenState();
}

class _AboutusScreenState extends State<AboutusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: const Text('About us', style: TextStyle(
          color: Colors.black,
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          //mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            Image.asset('assets/images/Roshita.png', width: 250, height: 250),
            const SizedBox(
              height: 15,
            ),
            const Text('Roshita is a healthcare application that aims to simplify the process of ordering and delivering prescription medications. A few clicks on the app and your medications are on their way. No need to wait in line at the pharmacy.'),
          ],
        ),
      ),
    );
  }
}