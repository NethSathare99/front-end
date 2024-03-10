import 'package:flutter/material.dart';
import 'package:spices_island_tea/screens/feedbackScreen.dart';
import 'package:spices_island_tea/screens/paymentScreen.dart';

import './const/colors.dart';
import './screens/splashScreen.dart';
import './screens/landingScreen.dart';
import './screens/loginScreen.dart';
import './screens/sign_up_screen.dart';
import './screens/forgetPwScreen.dart';
import './screens/sentOTPScreen.dart';
import './screens/homeScreen.dart';
import './screens/newPwScreen.dart';
import './screens/checkout_screen.dart';


Future<void> main() async {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
           AppColor.green,
          ),
          shape:MaterialStateProperty.all(
            StadiumBorder()
          ),
          elevation: MaterialStateProperty.all(0),
          ),
        ),
        textTheme: TextTheme(
          headline6: TextStyle(color: AppColor.secondary, fontSize: 25),
          bodyText2: TextStyle(
            color: AppColor.secondary,
          ),
        )  ,
      
      ),
      home: SplashScreen(), 
      routes: {
        LandingScreen.routeName: (context)=> LandingScreen(),
        LoginScreen.routeName: (context)=> LoginScreen(),
        SignUpScreen.routeName: (context)=> SignUpScreen(),
        ForgetPwScreen.routeName: (context)=> ForgetPwScreen(),
        SendOTPScreen.routeName: (context) => SendOTPScreen(),
        NewPwScreen.routeName:(context) => NewPwScreen(),
        HomeScreen.routeName:(context) => HomeScreen(),
        CheckoutScreen.routeName: (context) => CheckoutScreen(cartItems: []), 
        PaymentScreen.routeName: (context) => PaymentScreen(),
        FeedbackScreen.routeName:(context) => FeedbackScreen(),
      },
    );
  }
}
 
