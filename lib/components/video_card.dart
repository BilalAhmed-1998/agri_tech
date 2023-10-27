import 'package:agri_tech/components/circular_progress_card.dart';
import 'package:agri_tech/views/playVideoScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoCard extends StatelessWidget {
  final String title;
  final String duration;
  final String url;
  final double progress;

  const VideoCard({
    super.key,
    required this.url,
    required this.title,
    required this.duration,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: InkWell(
          onTap: () {
            Get.to(PlayVideoScreen(url: url, title: title,));
          },
          child: const CircleAvatar(
            backgroundColor: Color(0xff004040),
            radius: 22,
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        ), // Your play button image asset
        title: Text(title),
        subtitle: Text('Duration: $duration'),
        onTap: () {
          // Add your video playback logic here
        },
        trailing: CircularProgressCard(
            height: 35, width: 35, val: progress, textColor: Colors.black),
      ),
    );
  }
}
