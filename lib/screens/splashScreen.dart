import 'dart:async';

import 'package:flutter/material.dart';

import './landingScreen.dart';
import '../utils/helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 // ignore: unused_field
 Timer? _timer;
 

@override
  void initState() {
   _timer = Timer(Duration(milliseconds: 4000), () {
    Navigator.of(context).pushReplacementNamed(LandingScreen.routeName);
   });
    super.initState();
  } 

 
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
      width: Helper.getScreenWidth(context),
      height: Helper.getScreenHeight(context),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.topCenter, 
          child: Image.asset(
            Helper.getAssetName("logo.png", "images"),
          fit: BoxFit.fill,
          ),
        )
       
        ],
      ),
      ),
    );
  }
}