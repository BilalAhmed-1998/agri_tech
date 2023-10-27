import 'package:flutter/material.dart';

import 'circular_progress_card.dart';

class DashboardCard1 extends StatefulWidget {
  String text;
  double val;
  late Color color;
  DashboardCard1({Key? key, required this.text,required this.val}) : super(key: key) {
    if (text == 'Your Courses') {
      color = const Color(0xff0A0150);
    } else if (text == 'Your Seminars') {
      color = const Color(0xff562FBE);
    }
  }

  @override
  State<DashboardCard1> createState() => _DashboardCard1State();
}

class _DashboardCard1State extends State<DashboardCard1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircularProgressCard(
            width: 55,
            height: 55,
            val: widget.val,
            textColor: const Color(0xffdddddd),
            strokeWidth: 8,
          ),
          Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
