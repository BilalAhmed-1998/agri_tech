import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  static const routeName = '/LoadingCard';

  String text;

  LoadingCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dialog(
        backgroundColor: Colors.white,
        child: Container(
          margin: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 6,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation((Color(0xff004040))),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
