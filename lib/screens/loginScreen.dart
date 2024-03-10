import 'package:flutter/material.dart';
import 'package:spices_island_tea/widgets/http.dart';
import '../screens/forgetPwScreen.dart';

import '../utils/helper.dart';
import '../const/colors.dart';
import '../screens/sign_up_screen.dart';
import '../widgets/customTextInput.dart';
import '../screens/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

   @override
  _LoginScreenState createState() => _LoginScreenState();
}
  class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String response = "";

createUser() async {
    var result = await http_post("create-customer", {
      "name": emailController.text,
    });
    if(result.ok)
    {
      setState(() {
        response = result.data['status'];
      });
    }
  }

   bool _validateEmail(String email) {
   
    return RegExp(r'^.+@.+\..+$').hasMatch(email);
  }

  bool _validatePassword(String password) {
    
    return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{6,}$').hasMatch(password);
  }

  void _signUp() {
    String username = emailController.text;
    String password = passwordController.text;

    if (!_validateEmail(username)) {
      
      _showErrorDialog('Invalid email format');
    } else if (!_validatePassword(password)) {
      
      _showErrorDialog(
          'Invalid password format. Password must be at least 6 characters long, and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.');
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Login",
                  style: Helper.getTheme(context).headline6,
                ),
                Spacer(),
                Text('Add your details to login'),
                Spacer(),
                CustomTextInput(
                  hintText: "Your email",
                  controller: emailController,
                ),
                Spacer(),
                CustomTextInput(
                  hintText: "Password",
                  controller: passwordController,
                  obscureText: true, 
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                  ),
                  child: Text('Login'),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(ForgetPwScreen.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Forget your password?"),
                      Text(
                        "Reset Password",
                        style: TextStyle(
                          color: AppColor.green,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Text("or Login With"),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                    backgroundColor: MaterialStateProperty.all(Color(0xFFDD4B39)),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        Helper.getAssetName('google.png', 'images'),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Login with Google")
                    ],
                  ),
                ),
                Spacer(
                  flex: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account?"),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColor.green,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

