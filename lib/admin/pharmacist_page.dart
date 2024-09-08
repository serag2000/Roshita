import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/admin/create_account_pharmcist.dart';
import 'package:project/admin/home_screen_admin.dart';
import 'package:project/api/create_pharmacist.dart';
import 'package:project/api/pharmacist_admin.dart';
import 'package:project/helper/const.dart';
import 'package:project/models/admin_model/all_pharmacists.dart';


class PharmacistPage extends StatefulWidget {
  const PharmacistPage({super.key});

  @override
  State<PharmacistPage> createState() => _PharmacistPageState();
}

final _api = ShowpharmacistsForAdmine();
List<AllPharmacists> data = [];
  CreatePhatmacistApi deleteApi = CreatePhatmacistApi();

Future<List<AllPharmacists>> getPharmacistforadmin() async {
  try {
    var response = await _api.getPharmacistforadmin('api/adminAuth/pharamacistControl');
    var result = jsonDecode(response.body)['data'];
    if (response.statusCode == 200) {
      data = result
          .map<AllPharmacists>((item) => AllPharmacists.fromJson(item))
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


class _PharmacistPageState extends State<PharmacistPage> {
  @override
  void initState() {
    getPharmacistforadmin();
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
                title: const Text('Add Pharmacist'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  CreateAccountPharmcist(),
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
        title: const Text('Pharmacist', style: TextStyle(color: Colors.white)),
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
        onRefresh: () => getPharmacistforadmin(),
        child: FutureBuilder(
          future: getPharmacistforadmin(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>   CreateAccountPharmcist.edit(data: snapshot.data![index],)));
                      },
                      child: Center(
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
                                      'assets/images/gust.png',
                                      width: size.width / 6,
                                      height: size.width / 5,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '${snapshot.data![index].name}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '${snapshot.data![index].email}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Column(
                                      children: [
                                       
                                        SizedBox(
                                          height: 15,
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
