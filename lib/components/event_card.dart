import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'circular_progress_card.dart';

// ignore: must_be_immutable
class EventCard extends StatelessWidget {
  String title, title2, level, duration, registrationNo, type;
  double points;
  DateTime dateTime;
  double circularProgressVal;

  EventCard(
      {super.key,
      required this.registrationNo,
      required this.duration,
      required this.dateTime,
      required this.circularProgressVal,
      required this.type,
      required this.title,
      required this.level,
      required this.points,
      required this.title2});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff6C6C6C).withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///first row///
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.book,
                        color: Color(0xff004040),
                        size: 12,
                      ),
                      Text(
                        '  $title',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Transform.rotate(
                        angle: 90 * pi / 180,
                        child: const Icon(
                          Icons.linear_scale,
                          color: Color(0xff004040),
                          size: 12,
                        ),
                      ),
                      Text(
                        '    ',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.description,
                        color: Color(0xff004040),
                        size: 13,
                      ),
                      Text(
                        '  $title2',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  CircularProgressCard(
                    width: 32,
                    height: 32,
                    val: circularProgressVal,
                    textColor: Colors.grey.shade600,
                  ),
                   const SizedBox(height: 12,),
                   const Text('Seats',style: TextStyle(color: Colors.black,fontSize: 12),)
                ],
              )
            ],
          ),

          ///Second row///
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xff004040),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      level,
                      style: const TextStyle(
                          color: Color(0xffdddddd),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Level',
                      style: TextStyle(
                          color: Color(0xffdddddd),
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          height: 1.5),
                    ),
                  ],
                ),
                Transform.rotate(
                  angle: 90 * pi / 180,
                  child: const Icon(
                    Icons.linear_scale,
                    color: Color(0xffdddddd),
                    size: 25,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      duration,
                      style: const TextStyle(
                          letterSpacing: 0.5,
                          color: Color(0xffdddddd),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Duration',
                      style: TextStyle(
                          color: Color(0xffdddddd),
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          height: 1.5),
                    ),
                  ],
                ),
                Transform.rotate(
                  angle: 90 * pi / 180,
                  child: const Icon(
                    Icons.linear_scale,
                    color: Color(0xffdddddd),
                    size: 25,
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      '10:00 AM',
                      style: TextStyle(
                          color: Color(0xffdddddd),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Start Time',
                      style: TextStyle(
                          color: Color(0xffdddddd),
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          height: 1.5),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ///Last row///
          Row(
            children: [
              const Icon(
                CupertinoIcons.circle_fill,
                color: Colors.amber,
                size: 12,
              ),
              Text(
                '  Registration No: $registrationNo',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 12,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                CupertinoIcons.circle_fill,
                color: Colors.deepOrange,
                size: 12,
              ),
              Text(
                '  Mode: $type',
                style: TextStyle(
                    color: Colors.grey.shade800, fontSize: 12, height: 2),
              )
            ],
          ),

          ///Date Time///
          Text(
            "  ${DateFormat.yMMMEd().format(dateTime)}, ${DateFormat.jm().format(dateTime)} ",
            textAlign: TextAlign.start,
            style:
                TextStyle(color: Colors.grey.shade600, fontSize: 8, height: 4),
          )
        ],
      ),
    );
  }
}
