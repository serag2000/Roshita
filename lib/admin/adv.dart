import 'package:flutter/material.dart';
import 'package:project/admin/add_advertisment.dart';
import 'package:project/admin/home_screen_admin.dart';
import 'package:project/admin/modify_addAdvertisment.dart';

class Adv extends StatefulWidget {
  const Adv({super.key});

  @override
  State<Adv> createState() => _AdvState();
}

class _AdvState extends State<Adv> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreenAdmin(),));

        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        // leading: Image.asset('assets/images/Roshita.png'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.blue,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Ads',
                style: TextStyle(color: Colors.blue),
              ),
              Container(
                  width: 65,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAdvertisment(),));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                border: Border.all(color: Colors.blue)),
                            child: const Icon(Icons.add, color: Colors.blue)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'Add',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: size.width/30,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: 5,
              itemBuilder: (context, index) =>          Center(
              child: Container(
                width: 380,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10, ),color: Colors.blueGrey[500]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [const Text('vitamin C', style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),),
                    const Text('100MG',style: TextStyle(color: Colors.white, fontSize: 14, ),),
                    Image.asset('assets/images/Dw.png', width: size.width/6,height: size.width/5,),
                    const Text('30%',style: TextStyle(color: Colors.white, fontSize: 14, ),),
                    const Text('Special Offer',style: TextStyle(color: Colors.white, fontSize: 14, ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //IconButton(onPressed: (){}, icon: const Icon(Icons.mode_edit_rounded, color: Colors.white,)),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.delete, color: Colors.red,)),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ModifyAdvertisment(),));
                          },
                          child: Container(
                            width: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                  border: Border.all(color: Colors.white)),
                              child: const Center(child: Text('Modify',style: TextStyle(color: Colors.black, fontSize: 16,),))),
                        ),
                        
                      ],
                    ),
                    ],
                  ),
                ),
              ),
            ) ,),
          ),
        ],
      ),
    );
  }
}
