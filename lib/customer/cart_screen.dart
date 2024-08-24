import 'package:flutter/material.dart';
import 'package:project/customer/details_screen.dart';


import '../../helper/const.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title:
            const Text(
              "Cart",
              style: TextStyle(
                fontSize: 14,
                color: mainTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsScreen(),));
            }, icon: const Icon(Icons.arrow_back , color: Colors.black,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height / 1.7,
              child: ListView.separated(
                //physics:  NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 5),
                itemCount: 3,
                itemBuilder: (context, index) => const ContinerCartScreen(),
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
            ),
            // SizedBox(
            //   height: size.width / 12,
            // ),
           ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             const Padding(
               padding: EdgeInsets.all(20.0),
               child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "In Total",
                        style: TextStyle(
                          fontSize: 14,
                          color: mainTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$3000.00",
                        style: TextStyle(
                          fontSize: 14,
                          color: mainTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
             ),
                SizedBox(
                  height: size.width / 20,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CheckoutScreen(),));
                  },
                  child: Container(
                   width: size.width/1.1,
                    height: size.width / 6.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mainColor,
                      border: Border.all(color: mainColor, width: 2),
                    ),
                    child: const Center(
                      child: Text(
                        "Check out",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                          color: backgroundScreenColor,
                        ),
                      ),
                    ),
                  ),
                ),
              
          ],
        ),
      ),
    );
  }
}

class ContinerCartScreen extends StatefulWidget {
  const ContinerCartScreen({super.key});

  @override
  State<ContinerCartScreen> createState() => _ContinerCartScreenState();
}

class _ContinerCartScreenState extends State<ContinerCartScreen> {
  int index=1;
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/Dw.png",
                    width: size.width / 5,
                    height: size.width / 5,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   height: 5,
                      // ),
                      const Text(
                        "Lorem lpsum",
                        style: TextStyle(
                          fontSize: 14,
                          color: mainTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      const Text(
                        "is simply dummy text of the printing.",
                        style: TextStyle(
                          fontSize: 10,
                          color: greyTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                    "\$120LYD",
                    style: TextStyle(
                      fontSize: 12,
                      color: mainTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                     InkWell
                     (
                      onTap: () {
                        if (index > 1) {
                            setState(() {
                              index--;
                            });
                          }
                      },
                      child: const Text('-', style: TextStyle(
                        fontSize: 20
                      ),)),
      
                      const SizedBox(
                        width: 10,
                      ),
                      Text('${index}'),
                      const SizedBox(
                        width: 10,
                      ),
                     InkWell
                     (
                      onTap: () {
                        // Provider.of<counter>(context).increase();
                            setState(() {
                              index++;
                            });
                          
                      },
                      child: const Text('+', style: TextStyle(
                        fontSize: 20
                      ),)
                     ) ,
                     SizedBox(
                      width: size.width/2.8,
                     ),
                     IconButton(onPressed: () {
                       
                     }, icon: const Icon(Icons.delete , color: Colors.red,))
                    ],
                  ),
      
                    ],
                  ),
                ],
              ),
               ],
          ),
        ),
      ),
    );
  }
}