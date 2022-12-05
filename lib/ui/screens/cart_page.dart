
// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart';
//
// class CartPage extends StatefulWidget {
//   const CartPage({Key? key}) : super(key: key);
//
//   @override
//   State<CartPage> createState() => _CartPageState();
// }
//
// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//         centerTitle: true,
//         actions: [
//           Center(
//             child: Badge(
//             badgeContent:Text('0',style: TextStyle(color: Colors.white),),
//             animationDuration :Duration(milliseconds: 300),
//             child:Icon(Icons.add_shopping_cart_rounded)
//         ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: 2,
//                 itemBuilder: (context,index){
//               return Card(
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//
//                       ],
//                     )
//                   ],
//                 ),
//               );
//             }),
//           )
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:food_delivery_app/ui/screens/widgets/FoodWidget.dart';
import 'package:lottie/lottie.dart';

import '../../models/Food.dart';

class CartPage extends StatefulWidget {
  final List<Food> addedToCartFoods;
  const CartPage({Key? key, required this.addedToCartFoods}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  int totalAmount = 0;
  // getTotalAmount() {
  //   var count = 0;
  //   for (int i = 0; i < widget.addedToCartFoods.length; i++) {
  //     totalAmount=totalAmount+widget.addedToCartFoods.price[i];
  // }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.addedToCartFoods.isEmpty
          ? Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff6D2113).withOpacity(0.1),
            image: DecorationImage(
              image: AssetImage("assets/images/Group.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: size.width,
                child: Lottie.asset('assets/images/8325-mercuri-cart.json'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Your Cart is Empty',
                style: TextStyle(
                  color: Color(0xff6D2113),
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      )









          : Container(
        decoration: BoxDecoration(
          color: Color(0xff6D2113).withOpacity(0.1),
          image: DecorationImage(
            image: AssetImage("assets/images/Group.png"),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: widget.addedToCartFoods.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return FoodWidget(
                        index: index, foodList: widget.addedToCartFoods);
                  }),
            ),

            Column(
              children: [
                const Divider(thickness: 1.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Totals',style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                    Text(r'$65', style: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xff6D2113),
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}