import 'package:flutter/material.dart';
import 'package:spices_island_tea/widgets/http.dart';
import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customTextInput.dart';
import '../screens/loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/signUpScreen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String response = "";


createUser() async {
    var result = await http_post("create-customer", {
      "name": nameController.text,
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
    String email= emailController.text;
    String password = passwordController.text;
   

    if (!_validateEmail(email)) {
      
      _showErrorDialog('Invalid email format');
    } else if (!_validatePassword(password)) {
      
      _showErrorDialog(
          'Invalid password format. Password must be at least 6 characters long, and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.');
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            children: [
              Text(
                'Sign Up',
                style: Helper.getTheme(context).headline6,
              ),
              Spacer(),
              Text('Add your details to sign up'),
              Spacer(),
              CustomTextInput(
                hintText: "Name",
                controller:nameController,
              ),
              Spacer(),
              CustomTextInput(
                hintText: "Email",
                controller: emailController,
              ),
              Spacer(),
              CustomTextInput(
                hintText: "Address",
                controller: addressController,
              ),
              Spacer(),
              CustomTextInput(
                hintText: "Password",
                controller: passwordController,
                isPassword: true,
              ),
              Spacer(),
              CustomTextInput(
                hintText: "Confirm Password",
                controller: confirmPasswordController,
                isPassword: true,
              ),
              Spacer(),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                  },
                  child: Text("Sign Up"),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account?"),
                    Text(
                      "Login",
                      style: TextStyle(
                        color: AppColor.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
