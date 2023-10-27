import 'package:flutter/material.dart';

import '../utils/const.dart';
import 'circular_progress_card.dart';

class CardCourses extends StatelessWidget {
  final Image image;
  final String title;
  final String hours;
  final String progress;
  final double percentage;
  final Color color;

  const CardCourses(
      {super.key,
      required this.image,
      required this.title,
      required this.hours,
      required this.progress,
      required this.percentage,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30.0),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: color,
      ),
      child: Row(
        children: <Widget>[
          image,
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Constants.textDark),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  hours,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFF18C8E),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Row(
            children: <Widget>[
              Text(
                progress,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Constants.textDark,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: CircularProgressCard(
                      height: 50,
                      width: 50,
                      val: percentage,
                      textColor: const Color(0xFFF18C8E)))
            ],
          )
        ],
      ),
    );
  }
}
