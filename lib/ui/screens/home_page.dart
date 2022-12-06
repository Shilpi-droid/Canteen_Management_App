
// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../models/Food.dart';
import 'detail_page.dart';
import 'package:final_app/ui/screens/breakfast.dart';
import 'package:final_app/ui/screens/snacks.dart';
import 'package:final_app/ui/screens/dinner.dart';
import 'package:final_app/ui/screens/lunch.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    int selectedIndex=0;
    Size size=MediaQuery.of(context).size;
    List<Food> _foodList=Food.foodList;

    List<String> menu=const[
      'Breakfast',
      'Lunch',
      'Snacks',
      'Dinner',
    ];

    List<Image> menu_image=
    [
      Image.asset('assets/images/breakfast.jpg'),
      Image.asset('assets/images/lunch.jpg'),
      Image.asset('assets/images/snacks.jpg'),
      Image.asset('assets/images/dinner.jpg'),
    ];
    int sec_index=0;

    // Toggle favorite button
    bool toggleFavorated(bool isFavorited){
      return !isFavorited;
    }

    return Scaffold(

        body: Container(
          decoration: BoxDecoration(
            color: Color(0xff6D2113).withOpacity(0.1),
            image: DecorationImage(
              image: AssetImage("assets/images/Group.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Container(
                  //padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: 50.0,
                  width: size.width,
                  margin: EdgeInsets.only(left:18.0,top:15.0),
                  child: Text('Today\'s specials', style:
                  TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color:Color(0xff6D2113),
                  ),),
                ),
                SizedBox(
                  height: size.height *.3,
                  //width: size.width,
                  child: ListView.builder(
                      itemCount: _foodList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(BuildContext context,int index){
                        return GestureDetector(
                          onTap:(){
                            Navigator.push(context,PageTransition(child: DetailPage(foodId: _foodList[index].foodId,), type: PageTransitionType.bottomToTop));
                          },
                          child: Container(
                            width: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xff6D2113),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top:10,
                                  right:20,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    child: IconButton(
                                      onPressed:(){
                                        bool isFavorated = toggleFavorated(_foodList[index].isFavorated);
                                        _foodList[index].isFavorated=isFavorated;
                                      },
                                      icon:Icon(_foodList[index].isFavorated==true
                                          ? Icons.favorite : Icons.favorite_border, color: Color(0xff6D2113),),
                                      color: Color(0xff6D2113),
                                      iconSize: 30,
                                    ),
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                      borderRadius: BorderRadius.circular(50),

                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 50,
                                  right:50 ,
                                  top: 50,
                                  bottom: 50,
                                  child: Image.asset(_foodList[index].imageURL),),
                                Positioned(
                                  bottom: 15,
                                  left: 20,
                                  child: Column(
                                    children: [
                                      // Text(_foodList[index].category,
                                      //   style:const TextStyle(
                                      //     color:Colors.white70,
                                      //     fontSize:16,
                                      //   ),
                                      // ),
                                      Text(_foodList[index].foodItem,style:  const TextStyle(
                                        color:Colors.white70,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),),

                                    ],
                                  ),),
                                Positioned(
                                  bottom: 15,
                                  right: 20,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(r'$'+ _foodList[index].price.toString(),style: TextStyle(
                                      color: Color(0xff6D2113),
                                      fontSize: 16,
                                    ),),
                                  ),),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),



                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: 30.0,
                  width: size.width,
                  margin: EdgeInsets.only(left:18.0,top:15.0),
                  child: Text('Choose a meal', style:
                  TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color:Color(0xff6D2113),
                  ),),
                ),
                //
                Container
                  (
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: size.height * .5,
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //     image: AssetImage("assets/images/Group.png"),
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.only(top:20,left:35,right:35,bottom: 70),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,

                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xff6D2113),
                          borderRadius: BorderRadius.all(Radius.circular(14.0),),
                        ),
                        alignment: Alignment.center,
                        child: TextButton(
                          style: TextButton.styleFrom(foregroundColor:Colors.white, ),
                          onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const breakfast()));

                          },
                          child:const Text('Breakfast'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xff6D2113),
                          borderRadius: BorderRadius.all(Radius.circular(14.0),),
                        ),
                        alignment: Alignment.center,
                         child: TextButton(
                          style: TextButton.styleFrom(foregroundColor:Colors.white, ),
                          onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const lunch()));

                          },
                          child:const Text('lunch'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xff6D2113),
                          borderRadius: BorderRadius.all(Radius.circular(14.0),),



                        ),
                        alignment: Alignment.center,
                        child: TextButton(
                          style: TextButton.styleFrom(foregroundColor:Colors.white, ),
                          onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const snacks()));

                          },
                          child:const Text('snacks'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),

                        decoration: BoxDecoration(
                          color: Color(0xff6D2113),
                          borderRadius: BorderRadius.all(Radius.circular(14.0),),
                        ),
                        alignment: Alignment.center,
                        child: TextButton(
                          style: TextButton.styleFrom(foregroundColor:Colors.white, ),
                          onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const dinner()));

                          },
                          child:const Text('dinner'),
                        ),
                      )
                    ],
                  )
                )

              ],
            ) ,
          ),
        )
    );
  }
}




