import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zefyrka/zefyrka.dart';

class PlayVideoScreen extends StatefulWidget {
  String title;
  String url;
  PlayVideoScreen({Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  State<PlayVideoScreen> createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  late YoutubePlayerController _controller;
  late ZefyrController notesController;

  @override
  void initState() {
    super.initState();
    notesController = ZefyrController();

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url) ?? '',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        controlsVisibleAtStart: true,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        hideControls: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: const Color(0xff004040),
        ),
        builder: (context, player) => Scaffold(
              appBar: AppBar(
                iconTheme: const IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: const Color(0xff004040),
                centerTitle: true,
                automaticallyImplyLeading: true,
                title: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              body: ListView(
                children: [
                  player,
                  const SizedBox(
                    height: 20,
                  ),
                  _buildNotesWidget(context)
                ],
              ),
            ));
  }

  Widget _buildNotesWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 4,
            ),
            child: Text('Notes:',
                style: TextStyle(color: Colors.black, fontSize: 18)),
          ),
          ZefyrToolbar.basic(
            controller: notesController,
          ),
          ZefyrEditor(
            controller: notesController,
            minHeight: 400,
            autofocus: false,
            scrollable: true,
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        ],
      ),
    );
  }
}
