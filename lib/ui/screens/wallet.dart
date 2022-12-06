// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:final_app/utils/colors.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
            color: Color(0xff6D2113).withOpacity(0.1),
            image: DecorationImage(
              image: AssetImage("assets/images/Group.png"),
               fit: BoxFit.cover,
            )),
      ),
    );
  }
}
