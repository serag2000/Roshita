import 'package:flutter/material.dart';
import 'package:project/admin/create_account_doctor.dart';
import 'package:project/admin/home_screen_admin.dart';
import 'package:project/customer/doctor_details.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class Doctorview {
  final String Id;
  final String name;

  final String adescription;

  final String age;

  final String phone;
  Doctorview({
    required this.Id,
    required this.name,
    required this.adescription,
    required this.age,
    required this.phone,
  });
}

List<Doctorview> doctorview = [
  Doctorview(
    Id: '1',
    name: 'Serag',
    adescription: " دكتور  اسنان",
    age: '22',
    phone: '0928224321',
  ),
  Doctorview(
    Id: '1',
    name: 'rwad',
    adescription: " دكتور  مخ و اعصاب",
    age: '30',
    phone: '123456',
  ),
  Doctorview(
    Id: '1',
    name: 'ali',
    adescription: " دكتور  جراحه",
    age: '50',
    phone: '222222222',
  ),
  Doctorview(
    Id: '1',
    name: 'hossam',
    adescription: " دكتور  عيون",
    age: '75',
    phone: '565556554',
  ),
  Doctorview(
    Id: '1',
    name: 'ala',
    adescription: " دكتور  باطنه",
    age: '28',
    phone: '3256648',
  ),
  Doctorview(
    Id: '1',
    name: 'salem',
    adescription: " دكتور  عضام",
    age: '50',
    phone: '22587441',
  ),
  Doctorview(
    Id: '1',
    name: 'aya',
    adescription: " دكتور  ولادة",
    age: '30',
    phone: '9999999999',
  ),
];

class _DoctorsPageState extends State<DoctorsPage> {
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
                        builder: (context) => const CreateAccountDocotor(),
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
      body: ListView.builder(
        itemCount: doctorview.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorDetails(
                        name: doctorview[index].name,
                        adescription: doctorview[index].adescription,
                        phone: doctorview[index].phone,
                      ),
                    ));
              },
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(20)), //عشان تخلي شكلها منحرف
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.watch_later, color: Colors.white),
                          SizedBox(
                            width: size.width / 50,
                          ),
                          const Text('17/9/2000 , 8am- 10am')
                        ],
                      ),
                    ),
                    ListTile(
                        leading: Card(
                          clipBehavior: Clip.hardEdge,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20)), //عشان تخلي شكلها منحرف
                          ),
                          child: Image.asset("assets/images/se.png"),
                        ),
                        title: Text('${doctorview[index].name}',
                            style: const TextStyle(fontSize: 20)),
                        subtitle: Text('${doctorview[index].adescription}'),
                        trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              ' Delete ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Text(
                                              ' Are you showr to delete doctor ',
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AlertDialog(
                                                        title: Column(
                                                          children: [
                                                            const Text(
                                                                'The doctor cannot be deleted because he has issued Roshita',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red)),
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                      height: 30,
                                                                      width: 50,
                                                                      decoration: BoxDecoration(
                                                                        border:Border.all(color: Colors.blue) 
                                                                      ),
                                                                      child: const Center(child: Text('OK'))))
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 30,
                                                    width: 70,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: Colors.red),
                                                    child: const Center(
                                                      child: Text('Delete',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 120,
                                                ),
                                                Container(
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.blue)),
                                                    child: MaterialButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                            color: Colors.blue,
                                                          )),
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ));
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
