import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/video_card.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({Key? key}) : super(key: key);

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  bool infoBox = true;
  List<String> traits = ['Soil', 'Seeds', 'Sprays', 'Trackers', 'Drones'];
  Map<String, dynamic> equipments = {
    "  Data Loggers": 'assets/images/tool1.png',
    "Sprayers": 'assets/images/tool2.png',
    "Drones": 'assets/images/tool3.png',
    "Soil Samplers": 'assets/images/tool4.png',
    "Health Monitoring\nDevices": 'assets/images/tool5.png',
  };
  final List<Map<String, String>> videoData = [
    {
      'title': 'Digital Agriculture Part One',
      'duration': '15:03',
      'url':
          'https://m.youtube.com/watch?v=IU8czQPvA7Q&list=PLkNoAmOtt__-5NehbSBliRRu_9rm9mLIc&index=1&pp=iAQB',
    },
    {
      'title': 'Digital Agriculture Part Two',
      'duration': '14:46',
      'url':
          'https://m.youtube.com/watch?v=bwK1nebb9ko&list=PLkNoAmOtt__-5NehbSBliRRu_9rm9mLIc&index=2&pp=iAQB'
    },
    {
      'title': 'Precision Spraying Part One',
      'duration': '08:57',
      'url':
          'https://m.youtube.com/watch?v=1LarzAmH8Tk&list=PLkNoAmOtt__-5NehbSBliRRu_9rm9mLIc&index=3&pp=iAQB'
    },
    {
      'title': 'Precision Spraying Part Two',
      'duration': '15:48',
      'url':
          'https://m.youtube.com/watch?v=enxdaijoEOk&list=PLkNoAmOtt__-5NehbSBliRRu_9rm9mLIc&index=4&pp=iAQB'
    },
    {
      'title': 'Telemetry',
      'duration': '17:17',
      'url':
          'https://m.youtube.com/watch?v=enxdaijoEOk&list=PLkNoAmOtt__-5NehbSBliRRu_9rm9mLIc&index=4&pp=iAQB'
    },
    {
      'title': 'Drones',
      'duration': '22:33',
      'url':
          'https://m.youtube.com/watch?v=enxdaijoEOk&list=PLkNoAmOtt__-5NehbSBliRRu_9rm9mLIc&index=4&pp=iAQB'
    },
    {
      'title': 'Precision Planting Part One',
      'duration': '21:17',
      'url':
          'https://m.youtube.com/watch?v=enxdaijoEOk&list=PLkNoAmOtt__-5NehbSBliRRu_9rm9mLIc&index=4&pp=iAQB'
    },
    {
      'title': 'Precision Planting Part Two',
      'duration': '19:24',
      'url':
          'https://m.youtube.com/watch?v=enxdaijoEOk&list=PLkNoAmOtt__-5NehbSBliRRu_9rm9mLIc&index=4&pp=iAQB'
    },
    // Add more video data as needed
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: const Color(0xff004040),
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text(
          "Course Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: width,
                child: Image.asset(
                  'assets/images/course_detail_img.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(11, 9, 18, 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Precision Agriculture',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        for (var i = 0; i < traits.length; i++)
                          Text(
                            '#${traits[i]} ',
                            style: const TextStyle(
                                height: 1.8, color: Colors.black, fontSize: 12),
                          )
                      ],
                    ),
                    const Text(
                      '2 hours 30 Minutes',
                      style: TextStyle(color: Colors.black, height: 1.5),
                    ),
                    const Text(
                      'Level 0',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          fontSize: 13,
                          fontStyle: FontStyle.italic),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Curated by: AgriTech Team',
                          style: TextStyle(
                              color: Colors.black, fontSize: 12, height: 3),
                        ),
                        Text(
                          '10/2023',
                          style: TextStyle(
                              color: Colors.black, fontSize: 12, height: 3),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (!infoBox) {
                        setState(() {
                          infoBox = true;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(color: Colors.grey.shade300),
                            left: BorderSide(color: Colors.grey.shade300),
                            right: BorderSide(color: Colors.grey.shade300),
                            bottom: BorderSide(
                                color: (infoBox)
                                    ? const Color(0xff004040)
                                    : Colors.grey.shade200)),
                      ),
                      alignment: Alignment.center,
                      width: width / 2,
                      height: 38,
                      child: const Text(
                        'Information',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (infoBox) {
                        setState(() {
                          infoBox = false;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(color: Colors.grey.shade300),
                            left: BorderSide(color: Colors.grey.shade300),
                            right: BorderSide(color: Colors.grey.shade300),
                            bottom: BorderSide(
                                color: (!infoBox)
                                    ? const Color(0xff004040)
                                    : Colors.grey.shade200)),
                      ),
                      alignment: Alignment.center,
                      width: width / 2,
                      height: 38,
                      child: const Text(
                        'Videos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              infoBox
                  ? Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey.shade200)),
                            padding: const EdgeInsets.all(12),
                            height: 220,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Details',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      "Discover the future of agriculture through Precision Farming, where technology meets sustainability. This course explores the dynamic world of precision agriculture, empowering participants to revolutionize farming practices. Delve into the use of data collection tools like GPS, drones, and sensors, and learn how to harness farm management software for data-driven decision-making. Explore Geographic Information Systems (GIS) for spatial analysis and delve into remote sensing and aerial imaging for crop monitoring. Uncover the power of Variable Rate Technology (VRT) for precise input application and master the use of IoT devices and sensor networks. Understand weather and climate data's role in agriculture, optimizing irrigation management and soil nutrient use. Gain proficiency in precision planting, crop management, and automated machinery. Farm smarter with smart irrigation systems and farm management software. This course is suitable for agricultural professionals, farmers, and anyone passionate about modernizing agriculture for improved yield, sustainability, and profitability.",
                                      style: TextStyle(
                                          height: 1.5,
                                          color: Colors.black,
                                          fontSize: 13),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey.shade200)),
                            padding: const EdgeInsets.all(12),
                            height: 170,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Required Equipments',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 100,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      for (var i = 0;
                                          i < equipments.length;
                                          i++)
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.grey.shade200)),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          width: 95,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                //height: 60,
                                                width: 60,
                                                child: Image.asset(
                                                  equipments.values
                                                      .elementAt(i),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                equipments.keys.elementAt(i),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey.shade200)),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Suggested Company Products',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // SizedBox(
                                //   height: 90,
                                //   child: ListView(
                                //     scrollDirection: Axis.horizontal,
                                //     children: [
                                //       for (var i = 0;
                                //           i <
                                //               widget
                                //                   .plan
                                //                   .planDetails
                                //                   .suggestedDietPlans
                                //                   .keys
                                //                   .length;
                                //           i++)
                                //         Container(
                                //           margin: const EdgeInsets.symmetric(
                                //               horizontal: 5),
                                //           decoration: BoxDecoration(
                                //               borderRadius:
                                //                   BorderRadius.circular(10),
                                //               border: Border.all(
                                //                   color: Colors.grey.shade200)),
                                //           width: 160,
                                //           child: Column(
                                //             mainAxisSize: MainAxisSize.min,
                                //             children: [
                                //               Container(
                                //                 //height: 60,
                                //                 width: 160,
                                //                 child: Image.asset(
                                //                   widget.plan.planDetails
                                //                       .suggestedDietPlans.values
                                //                       .elementAt(i),
                                //                   fit: BoxFit.contain,
                                //                 ),
                                //               ),
                                //               const SizedBox(height: 5),
                                //               Text(
                                //                 widget.plan.planDetails
                                //                     .suggestedDietPlans.keys
                                //                     .elementAt(i),
                                //                 style: const TextStyle(
                                //                   color: Colors.black,
                                //                   fontSize: 12,
                                //                 ),
                                //               )
                                //             ],
                                //           ),
                                //         )
                                //     ],
                                //   ),
                                // )
                                // Row(
                                //   children: [
                                //     for(var i=0;i<widget.plan.planDetails.suggestedDietPlans.keys.length;i++)
                                //     SuggestedDietPlanCard(
                                //       title: widget.plan.planDetails.suggestedDietPlans.keys.elementAt(i),
                                //       img: widget.plan.planDetails.suggestedDietPlans.values.elementAt(i),
                                //     ),
                                //
                                //   ],
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: Get.height,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: videoData.length,
                        itemBuilder: (context, index) {
                          return VideoCard(
                            title: videoData[index]['title'] ?? '',
                            duration: videoData[index]['duration'] ?? '',
                            url: videoData[index]['url'] ?? '',
                            progress: 0.1 * (videoData.length - index),
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
