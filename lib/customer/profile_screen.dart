import 'package:flutter/material.dart';
import 'package:project/customer/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final forkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Profile',style: TextStyle(
          color: Colors.black
        )),
                leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
        }, icon:const Icon(Icons.arrow_back, color: Colors.black,)),
      ),
      body: Form(
        key: forkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
        
              Column(
                children: [
                  const Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius: 50.5,
                      ),
                      CircleAvatar(
                       radius: 51,
                       backgroundImage: AssetImage('assets/images/pro.JPG'),
                      ),
                       CircleAvatar(
                        backgroundColor: Colors.white,
                       radius: 15,
                       child: Icon(Icons.edit)
                      ),
           
                    ],
                  ),
                  SizedBox(
                    height: size.width/25,
                  ),
                  const Text('Serag Sh', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  )),
                  SizedBox(
                    height: size.width/25,
                  ),
                ],
                
              ),
              
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                          labelText: ('UserName'),
                        ),
                        validator: (value) {
                      if(value!.length>=2)
                      {
                        return null;
                      }
                      else{
                        return 'Enter Your Name';
                      }
                    },
                      ),
                     TextFormField(
                        decoration: const InputDecoration(
                          labelText: ('Gender'),                        
                        ),
                        validator: (value) {
                      if(value!.length>=4)
                      {
                        return null;
                      }
                      else{
                        return 'Enter Your Gender';
                      }
                    },
                      ),
                 TextFormField(
                        decoration: const InputDecoration(
                          labelText: ('Phone Number'),
                          
                        ),
                        validator: (data){
                          if(data !.isEmpty){
                            return 'inter your number';
                          }
                          final regexp = RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$'
);
                          if(!regexp.hasMatch(data)){
                            return ' Inter your Securty';
                          }
                          return null;
                    }
                      ),
                 TextFormField(
                        decoration: const InputDecoration(
                          labelText: ('Email'),
                          
                        ),
                        validator: (data){
                          if(data !.isEmpty){
                            return 'this field is required';
                          }
                          final regexp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if(!regexp.hasMatch(data)){
                            return ' Inter your Securty';
                          }
                          return null;
                    }
                      ),
                 TextFormField(
                        decoration: const InputDecoration(
                          labelText: ('Password'),
                          
                        ),
                        validator: (data){
                          if(data !.isEmpty){
                            return 'this field is required';
                          }
                          return null;
                        }
                      ),
                
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  if(forkey.currentState!.validate()){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const EditProfile()));
                  }
                  
                },
                child: Container(
                                           width: double.infinity,
                                           height: size.width / 11,
                                           decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(color: Colors.blue, width: 2),
                                                             ),
                                           child: const Center(
                                             child: Text(
                                               "Edit",
                                               style: TextStyle(
                                                 fontSize: 14,
                                                color: Colors.white,
                                               ),
                                               ),
                                           ),
                                       ),
              ),
            ),
            ],
          ),
        ),
      ),
    ) ;
  }
}




class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
 final forkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
                leading: IconButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                }, icon: const Icon(Icons.arrow_back) ,color: Colors.black,),

        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Edit Profile',style: TextStyle(
          color: Colors.black
        )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: forkey,
          child: Column(
            children: [
              
              Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      const CircleAvatar(
                        radius: 50.5,
                      ),
                      const CircleAvatar(
                       radius: 51,
                       backgroundImage: AssetImage('assets/images/pro.JPG'),
                      ),
                       CircleAvatar(
                        backgroundColor: Colors.white,
                       radius: 15,
                       child: IconButton( icon:  const Icon(Icons.edit ,color: Color.fromARGB(255, 104, 177, 237) , size: 19), onPressed: () {
                         
                       },),
                      ),
           
                    ],
                  ),
                  SizedBox(
                    height: size.width/25,
                  ),
                  const Text('Serag Sh', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  )),
                  SizedBox(
                    height: size.width/25,
                  ),
                ],
                
              ),
              
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                      TextFormField(
                          decoration: const InputDecoration(
                            labelText: ('UserName'),
                          ),
                          validator: (value) {
                        if(value!.length>=2)
                        {
                          return null;
                        }
                        else{
                          return 'Enter Your Name';
                        }
                      },
                        ),
                       TextFormField(
                          decoration: const InputDecoration(
                            labelText: ('Gender'),                        
                          ),
                          validator: (value) {
                        if(value!.length>=4)
                        {
                          return null;
                        }
                        else{
                          return 'Enter Your Gender';
                        }
                      },
                        ),
                   TextFormField(
                          decoration: const InputDecoration(
                            labelText: ('Phone Number'),
                            
                          ),
                          validator: (data){
                            if(data !.isEmpty){
                              return 'inter your number';
                            }
                            final regexp = RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$'
        );
                            if(!regexp.hasMatch(data)){
                              return ' Inter your Securty';
                            }
                            return null;
                      }
                        ),
                   TextFormField(
                          decoration: const InputDecoration(
                            labelText: ('Email'),
                            
                          ),
                          validator: (data){
                            if(data !.isEmpty){
                              return 'this field is required';
                            }
                            final regexp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                            if(!regexp.hasMatch(data)){
                              return ' Inter your Securty';
                            }
                            return null;
                      }
                        ),
                   TextFormField(
                          decoration: const InputDecoration(
                            labelText: ('Password'),
                            
                          ),
                          validator: (data){
                            if(data !.isEmpty){
                              return 'this field is required';
                            }
                            return null;
                          }
                        ),
                  
                  ],
                ),
              ),
                Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    if(forkey.currentState!.validate()){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
                    }
                    
                  },
                  child: Container(
                                             width: double.infinity,
                                             height: size.width / 11,
                                             decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Colors.blue, width: 2),
                                                               ),
                                             child: const Center(
                                               child: Text(
                                                 "Save",
                                                 style: TextStyle(
                                                   fontSize: 14,
                                                  color: Colors.white,
                                                 ),
                                                 ),
                                             ),
                                         ),
                ),
              ),
              
               ],
          ),
        ),
      ),
    ) ;
  }
}