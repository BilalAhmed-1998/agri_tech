import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  String text;
  double height, width;

  SignInButton({super.key,required this.width,required this.text,required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xff004040),
      ),
      alignment: Alignment.center,
      width: width,
      height: height,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
