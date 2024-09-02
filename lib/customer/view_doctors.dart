import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/api/show_doctorsforuser.dart';
import 'package:project/customer/doctor_details.dart';
import 'package:project/models/user_doctors.dart';

class ViewDoctors extends StatefulWidget {
  const ViewDoctors({super.key});

  @override
  State<ViewDoctors> createState() => _ViewDoctorsState();
}

// class Doctorview{
//   final String Id;
//     final String name;

//   final String adescription;

//   final String age;

//   final String phone;
//   Doctorview({
//     required this.Id,
//         required this.name,

//     required this.adescription,

//     required this.age,
//         required this.phone,

//   });

// }

// List<Doctorview> doctorview =[
//   Doctorview(
//     Id: '1',
//     name: 'Serag',
//     adescription: " دكتور  اسنان",
//     age: '22',
//     phone: '0928224321',
//   ),
//    Doctorview(
//     Id: '1',
//     name: 'rwad',
//     adescription: " دكتور  مخ و اعصاب",
//     age: '30',
//     phone: '123456',
//   ),
//  Doctorview(
//     Id: '1',
//     name: 'ali',
//     adescription: " دكتور  جراحه",
//     age: '50',
//     phone: '222222222',
//   ),
//  Doctorview(
//     Id: '1',
//     name: 'hossam',
//     adescription: " دكتور  عيون",
//     age: '75',
//     phone: '565556554',
//   ),
//  Doctorview(
//     Id: '1',
//     name: 'ala',
//     adescription: " دكتور  باطنه",
//     age: '28',
//     phone: '3256648',
//   ),
//  Doctorview(
//     Id: '1',
//     name: 'salem',
//     adescription: " دكتور  عضام",
//     age: '50',
//     phone: '22587441',
//   ),
//  Doctorview(
//     Id: '1',
//     name: 'aya',
//     adescription: " دكتور  ولادة",
//     age: '30',
//     phone: '9999999999',
//   ),

// ];

class _ViewDoctorsState extends State<ViewDoctors> {
  // @override
  // void initState() {
  //   ShowDoctors();
  //   super.initState();
  // }
  @override
  void initState() {
    getAllDoctors();
    super.initState();
  }

  final _api = ShowDoctors();
  List<Userdoctors> data = [];

  Future<List<Userdoctors>> getAllDoctors() async {
    // isLoading = true;
    try {
      var response = await _api.getAllDoctors('api/doctros');
      var result = jsonDecode(response.body)['data'];
      if (response.statusCode == 200) {
        data = result
            .map<Userdoctors>((item) => Userdoctors.fromJson(item))
            .toList();

        // await prefs.setBool('islogin', true);
        // await prefs.setString('token', result['access_token']);
        // // ignore: use_build_context_synchronously

        // setCoins(data);
      } else {
        if (kDebugMode) {
          print("response.statusCode ===> ${response.statusCode}");
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 231, 232),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 10, 46, 75),
          title: const Text('Doctors', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  // showSearch(context: context, delegate: DataSearch());
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
          elevation: 0,
        ),
        body: FutureBuilder(
            future: getAllDoctors(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetails(name:doctorview[index].name, adescription: doctorview[index].adescription,phone: doctorview[index].phone,),));
                        },
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                              20,
                            )), //عشان تخلي شكلها منحرف
                          ),
                          child: Column(
                            children: [
                              // Container(
                              //   height: 50,
                              //   color: Colors.white,
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceAround,
                              //     children: [
                              //       const Icon(Icons.watch_later,
                              //           color: Colors.white),
                              //       SizedBox(
                              //         width: size.width / 50,
                              //       ),
                              //        Text("${snapshot.data![index].email}"),
                              //     ],
                              //   ),
                              // ),
                              ListTile(
                                  leading: Card(
                                    clipBehavior: Clip.hardEdge,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              20)), //عشان تخلي شكلها منحرف
                                    ),
                                    child:
                                        Image.asset("assets/images/gust.png"),
                                  ),
                                  title: Text('${snapshot.data![index].name}'),
                                  // title: Text('${doctorview[index].name}', style: const TextStyle(fontSize: 20)),
                                  // subtitle: Text('${doctorview[index].adescription}'),
                                  subtitle:
                                      Text('${snapshot.data![index].email}'),
                                  trailing: Text(
                                      '${snapshot.data![index].phoneNumber}')),
                            ],
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
            }));
  }
}
