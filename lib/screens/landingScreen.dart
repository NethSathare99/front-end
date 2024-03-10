import 'package:flutter/material.dart';

import '../screens/loginScreen.dart';
import '../screens/sign_up_screen.dart';
import '../const/colors.dart';
import '../utils/helper.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = "/landingScreen";

  @override
  Widget build(BuildContext context) {
    var align = Align (
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: Helper.getScreenHeight(context) * 0.3,
                padding: const EdgeInsets.symmetric(horizontal:60),
                child: Column(
                  children:[
                    Flexible(
                      child: Text(
                  "Discover the best Tea & Spices in Sri Lanka",
                  textAlign: TextAlign.center,
                  ),
                    ),
                    Spacer(),
                    SizedBox(
                      width:double.infinity,
                      height:50,
                      child: ElevatedButton(
                        onPressed:() {
                          Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routeName);
                           },
                         child: Text("Login"),
                         ),
                    ),
                    SizedBox(
                      height:20,
                    ),
                    SizedBox(
                      width:double.infinity,
                      height:50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: 
                          MaterialStateProperty.all(Colors.white),
                          foregroundColor: 
                          MaterialStateProperty.all(AppColor.green),
                          shape:
                          MaterialStateProperty.all(StadiumBorder(
                            side: BorderSide(
                              color: AppColor.green, width:1.5
                            ),
                          ),
                          ),
                        ),
                        onPressed:() { 
                          Navigator.of(context)
                             .pushReplacementNamed(SignUpScreen.routeName);
                             },
                         child: Text("Create an account"),
                         ),
                    ),
                    
                  ],
                 
                  ),
              ),
            );
    return Scaffold(
      body:Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child:Stack(
          children: [
             Align(
                alignment: Alignment.topCenter,
                child:  Container(
                    width: double.infinity,
                    height: Helper.getScreenHeight(context)*0.5,
                    decoration: ShapeDecoration(
                      
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(05),
                    
                    ),
                    
                    ),
                    child: Image.asset(Helper.getAssetName("login_bg.png","images"),
                    ),
                    ),
                  
                ),
              
            align,
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                Helper.getAssetName("logo.png", "images"),
              ),
            ),
             
          ],
        ) ,
        ),
    );
  }
}

