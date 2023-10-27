import 'package:agri_tech/components/dashboard_card1.dart';
import 'package:agri_tech/components/event_card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'circular_progress_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // final Stream _usersStream = FirebaseFirestore.instance
  //     .collection('users')
  //     .doc(FirebaseAuth.instance.currentUser?.uid)
  //     .collection('vehicles')
  //     .snapshots();
  String? name =
      FirebaseAuth.instance.currentUser?.displayName?.split(" ").first ?? '';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///APPBAR ATTACHED CONTAINER///
          Container(
            padding: const EdgeInsets.fromLTRB(20, 2, 22, 12),
            width: width,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff004040)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff0A0A0A).withOpacity(0.35),
                  spreadRadius: 0,
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
              color: const Color(0xff004040),
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(22),
                  bottomLeft: Radius.circular(22)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, $name',
                  style: const TextStyle(
                    color: Color(0xffdddddd),
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Check your academic progress ",
                          style: TextStyle(
                            color: Color(0xffdddddd),
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                          size: 20,
                          color: Color(0xffdddddd),
                        ),
                      ],
                    ),

                    ///tween builder///
                    CircularProgressCard(
                      width: 32,
                      height: 32,
                      val: 0.6,
                      textColor: const Color(0xffdddddd),
                    )
                  ],
                ),
              ],
            ),
          ),

          // /// MAIN DASHBOARD PARTS///
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
            child: Text(
              'DASHBOARD',
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 12,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: DashboardCard1(
                    text: 'Your Courses',
                    val: 0.3,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: DashboardCard1(text: 'Your Seminars', val: 0.8),
                ),
              ],
            ),
          ),
          //
          // /// Recent Event///
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Text(
              'UPCOMING EVENT',
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 12,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            ),
          ),
          EventCard(
              registrationNo: '110AB742',
              duration: '1h 30m',
              dateTime: DateTime.now(),
              circularProgressVal: 0.72,
              type: 'Virtual',
              title: 'Topic: Hybrid Seeds',
              level: 'Beginner',
              points: 100,
              title2: 'Tomorrow')
        ],
      ),
    );
  }
}
