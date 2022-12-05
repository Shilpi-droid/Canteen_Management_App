
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'RootPage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(

              image: AssetImage('assets/images/OnboardingBG.png'),fit:BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => const RootPage()));
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height:650,
              child: Positioned(
                bottom: 400,
                left: 190,
                child: PageView(
                  onPageChanged: (int page) {
                    setState(() {
                      currentIndex = page;
                    });
                  },
                  controller: _pageController,
                  children: [
                    createPage(
                      image:'assets/images/78267-food-choice.json',
                      //description: 'Check out your options here',
                    ),
                    createPage(
                      image:'assets/images/24703-food-animation.json',
                      //description:'Waiting at the queue in the mess is frustrating? Not anymore ',
                    ),
                    createPage(
                      image: 'assets/images/75783-prepare-food.json',
                      //description:'Happy Ordering!',
                    )
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 200,
              left: 190,
              child: Row(
                children: _buildIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}

class createPage extends StatelessWidget {
  final String image;
  //final String description;
  const createPage({
    Key? key,
    required this.image,
    //required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top:50.0,bottom:0.0),
            child: SizedBox(
              height: 80,
              child: Text(
                  'KAKU\'S CANTEEN',
                textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    //fontWeight: FontWeight.bold,
                    backgroundColor: Colors.transparent,
                  ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:0.0),
            child: SizedBox(
              height: 280,
              child: Lottie.asset(image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              height:40,
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(top:20.0),
             child: SizedBox(
              height:50,
               //width: 30,
          ),
           ),
          Image.asset("assets/images/line vector.png"),
        ],
      ),
    );
  }
}

//Create the indicator decorations widget
Widget _indicator(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 10.0,
    width: isActive ? 20 : 8,
    margin: const EdgeInsets.only(right: 5.0),
    decoration: BoxDecoration(
      color: Colors.white54,
      borderRadius: BorderRadius.circular(5),
    ),
  );
}

// create the indicator list

