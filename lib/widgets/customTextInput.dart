import 'package:flutter/material.dart';
import '../const/colors.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    required String hintText,
    required TextEditingController controller,
    bool isPassword = false, 
    this.obscureText = false,
    Key? key,
  })  : _hintText = hintText,
        _controller = controller,
        _isPassword = isPassword, 
        super(key: key);

  final String _hintText;
  final TextEditingController _controller;
  final bool _isPassword;
  final bool obscureText; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: AppColor.placeholderBg,
        shape: StadiumBorder(),
      ),
      child: TextField(
        controller: _controller,
        obscureText: _isPassword, // Use _isPassword to determine whether it's a password field
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: TextStyle(
            color: AppColor.placeholder1,
          ),
          contentPadding: const EdgeInsets.only(left: 40),
        ),
      ),
    );
  }
}
