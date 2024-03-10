import 'package:flutter/material.dart';

import '../utils/helper.dart';
import '../widgets/customTextInput.dart';
import '../screens/sentOTPScreen.dart';


class ForgetPwScreen extends StatelessWidget {
  static const routeName = "/resetpwScreen";

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Reset Password",
                  style: Helper.getTheme(context).headline6,
                ),
                Spacer(),
                Text(
                  "Please enter your email to receive a link to create a new password via email",
                  textAlign: TextAlign.center,
                ),
                Spacer(flex: 2),
                CustomTextInput(
                  hintText: "Email",
                  controller: emailController,
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(SendOTPScreen.routeName);
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                  ),
                  child: Text("Send"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}