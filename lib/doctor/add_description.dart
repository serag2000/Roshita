import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddDescription extends StatefulWidget {
  const AddDescription({super.key});

  @override
  State<AddDescription> createState() => _AddDescriptionState();
}

class _AddDescriptionState extends State<AddDescription> {
  int count = 1;

  // List<String> itemList = [" Item 1", "Item 2", "Item 3 "];
  // String selectMedicine = "Item 1 ";
  final List<String> items = [
    'Item1 ',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Add Roshita', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    label: const Text('Patient Name'),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: size.width / 35,
              ),
              TextFormField(
                decoration: InputDecoration(
                    label: const Text('Patient Birthday'),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: size.width / 35,
              ),
              TextFormField(
                decoration: InputDecoration(
                    label: const Text('Customer Email'),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: size.width / 35,
              ),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: ('Medicine'),
                ),
              ),
              SizedBox(
                height: size.width / 35,
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: count,
                  itemBuilder: (context, index) => Row(
                    children: [
                      SizedBox(
                        width: size.width / 2.3,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(8)),
                          // child: DropdownButton(
                          //   value: 'item1 ',
                          //   hint: const Text('selectMedicine'),
                          //   items: itemList
                          //       .map((e) => DropdownMenuItem(
                          //             child: Text(e),
                          //             value: e,
                          //           ))
                          //       .toList(),
                          //   onChanged: (val) {
                          //     setState(() {
                          //       selectMedicine= val!;
                          //     });
                          //   },
                          // ),

                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Text(
                              'Select Item',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: items
                                .map((String item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              height: 55,
                              width: 140,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width / 30),
                      SizedBox(
                        width: size.width / 2.2,
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: ('Time'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.width / 35,
              ),
              SizedBox(
                height: size.width / 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          if (count < 5) {
                            count++;
                          }
                        });
                      },
                      child: const Icon(Icons.add)),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          if (count > 1) {
                            count--;
                          }
                        });
                      },
                      child: const Icon(Icons.remove)),
                ],
              ),
              SizedBox(
                height: size.width / 35,
              ),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: ('Description'),
                ),
              ),
              SizedBox(
                height: size.width / 35,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Column(
                        children: [
                          const Text('Are you sure about this data ?'),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              Container(
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Column(
                                          children: [
                                            const Text(
                                                'The user is not registered in app',
                                                style: TextStyle(
                                                    color: Colors.red)),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('OK'))
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text('Yes',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue)),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel',
                                        style: TextStyle(
                                          color: Colors.blue,
                                        )),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: size.width / 8,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.blue, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width / 30,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15,
                          )),
                      SizedBox(
                        width: size.width / 30,
                      ),
                      const Text(
                        "Add",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class RoshitaPdf extends StatefulWidget {
//   const RoshitaPdf({super.key});

//   @override
//   State<RoshitaPdf> createState() => _RoshitaPdfState();
// }

// class _RoshitaPdfState extends State<RoshitaPdf> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
        
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Center(
//                 child: ClipOval(
//                   child: Image.asset("assets/images/Roshita.png" , width: 100,height: 70),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Dr :Name'),
//                   Text('Date : 2024/1/1'),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Dr :Name'),
//                   Text('Date : 2024/1/1'),
//                 ],
//               ),
        
//               TextFormField(),
//               TextFormField(),
//               TextFormField(),
//               TextFormField(),
//               SizedBox(
//                 height: 50,
//               ),
//               TextFormField(
//                 maxLines: 5,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   labelText: ('Note'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
