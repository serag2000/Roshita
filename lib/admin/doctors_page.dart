import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/admin/create_account_doctor.dart';
import 'package:project/admin/home_screen_admin.dart';
import 'package:project/api/show_doctorsforadmin.dart';
import 'package:project/helper/const.dart';
import 'package:project/models/admin_model/doctor_control.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

final _api = ShowDoctorsForAdmine();
List<DoctorControl> data = [];




Future<List<DoctorControl>> getDoctorsforadmin() async {
  try {
    var response = await _api.getDoctorsforadmin('api/adminAuth/doctorControl');
    var result = jsonDecode(response.body)['data'];
    if (response.statusCode == 200) {
      data = result
          .map<DoctorControl>((item) => DoctorControl.fromJson(item))
          .toList();
    } else {
      if (kDebugMode) {
       // print("response.statusCode ===> ${response.statusCode}");
        print("data ====> $data");
      }
      if (kDebugMode) {
        print("response ===> ${response.body}");
      }
      // ignore: use_build_context_synchronously
      // mySnackBarBack(context, result["error"]);

      // await prefs.setBool('islogin', false);
    }
  } catch (e) {
    // await prefs.setBool('islogin', false)
  }

  return data;
}

class _DoctorsPageState extends State<DoctorsPage> {
  @override
  void initState() {
    getDoctorsforadmin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading:
                    const Icon(Icons.add_circle_outline, color: Colors.blue),
                title: const Text('Add Doctor'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  CreateAccountDocotor(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 231, 232),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 46, 75),
        title: const Text('Doctors', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                // showSearch(context: context, delegate: DataSearch());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreenAdmin(),
                    ));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ))
        ],
        elevation: 0,
      ),
      body: RefreshIndicator(
        color: mainColor,
        backgroundColor: backgroundScreenColor,
        onRefresh: () => getDoctorsforadmin(),
        child: FutureBuilder(
          future: getDoctorsforadmin(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: InkWell(
                        onTap: (){
                        
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => CreateAccountDocotor.edit(data:snapshot.data![index] ,) ));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      fit: BoxFit.scaleDown,
                                      'assets/images/gust.png',
                                      width: size.width / 8.5,
                                      height: size.width / 7,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            snapshot.data![index].name,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            snapshot.data![index].email,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          snapshot.data![index].phoneNumber,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          snapshot.data![index].specilization,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return SizedBox(
                height: size.height * 0.65,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
