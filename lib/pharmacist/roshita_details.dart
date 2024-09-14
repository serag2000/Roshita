import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/api/pharmacy_api.dart';
import 'package:project/customer/loading.dart';
import 'package:project/customer/login_screen.dart';
import 'package:project/models/pharmacy.dart';
import 'package:project/pharmacist/pharmacist_proflie.dart';

class RoshitaDetails extends StatefulWidget {
  const RoshitaDetails({super.key});

  @override
  State<RoshitaDetails> createState() => _RoshitaDetailsState();
}

//pharmacist-moad@gmail.com

class _RoshitaDetailsState extends State<RoshitaDetails> {
  bool isLoading = false;
  bool canEdit = true;
  List<Pharmacy> _pharmacy = [];
  PharmacyApi api = PharmacyApi();

  @override
  void initState() {
    if (kDebugMode) {
      print('========================================');
      getPharmacy(context: context);
    }
    super.initState();
  }

  Future<void> getPharmacy({required BuildContext context}) async {
    try {
      setState(() {
        isLoading = true;
      });
      var response =
          await api.getRoshita('api/pharamacistAuth/pharamacistAction');
      var result = jsonDecode(response.body)['data'];
      if (kDebugMode) {
        print(result);
        print(response.statusCode);
        print(response.body);
      }
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body)['data'];
        if (response.statusCode == 200) {
          _pharmacy =
              result.map<Pharmacy>((item) => Pharmacy.fromJson(item)).toList();
          if (kDebugMode) {
            // print("dddd ${jsonDecode(response.body)['data']}");
            // print("res: $result");
            // print("resultssss ===> ${data}");
          }
        } else {
          if (kDebugMode) {
            // print("response.statusCode ===> ${response.statusCode}");
          }
          if (kDebugMode) {
            print("response ===> ${response.body}");
          }
          if (kDebugMode) {
            print(response.body);
          }
          if (kDebugMode) {
            print(response.statusCode);
          }
        }
        setState(() {
          isLoading = false;
        });

        // ignore: use_build_context_synchronously
        // mySnackBarBack(context, result["error"]);

        // await prefs.setBool('islogin', false);
      }
    } catch (e) {
      mySnackBarBack(context, e.toString());
    }
  }

  Future<void> editRoshita(
      {required BuildContext context, required int id}) async {
    try {
      setState(() {
        isLoading = true;
      });
      var response =
          await api.putRoshita('api/pharamacistAuth/pharamacistAction/$id');

      if (response.statusCode == 200) {
        getPharmacy(context: context);
      } else {
        if (kDebugMode) {
          // print("response.statusCode ===> ${response.statusCode}");
        }
        if (kDebugMode) {
          print("response ===> ${response.body}");
        }
        if (kDebugMode) {
          print(response.body);
        }
        if (kDebugMode) {
          print(response.statusCode);
        }
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {}

    // ignore: use_build_context_synchronously
    // mySnackBarBack(context, result["error"]);

    // await prefs.setBool('islogin', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilepharmacistScreen(),
                  ));
            },
            icon: const Icon(Icons.person),
            color: Colors.blue,
          )
        ],
        title: const Text('Pharmacist', style: TextStyle(color: Colors.black)),
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu, color: Colors.black),
          );
        }),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log out'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loading(),
                    ));
              },
            )
          ],
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                getPharmacy(context: context);
              },
              child: ListView.builder(
                itemCount: _pharmacy.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Column(
                            children: [
                              const Text('are u sure ?',
                                  style: TextStyle(color: Colors.black)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        //create(context: context);
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel')),

                                  TextButton(
                                      onPressed: () {
                                        editRoshita(context: context, id: _pharmacy[index].id);
                                      },
                                      child: const Text('Yes'))
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                      //editRoshita(context: context, id: _pharmacy[index].id);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text(
                                      'patient name : ${_pharmacy[index].userName}'),
                                ),
                             
                               Text('user email : ${_pharmacy[index].userEmail}'),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('doctors name: ${_pharmacy[index].doctorName} '),
                               
                                Text('specilization : ${_pharmacy[index].specilization}'),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('medicine name : ${_pharmacy[index].medicine1}'),
                               
                                Text('Time :${_pharmacy[index].time1}'),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                             Row(
                              
                              children: [
                                
                               
                                Text('Birth Day:${_pharmacy[index].birthday} '),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
