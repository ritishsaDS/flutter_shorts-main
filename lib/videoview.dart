import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_shorts/screens/Audios.dart';
import 'package:just_audio/just_audio.dart';

import 'package:video_player/video_player.dart';

class VideoViewPage extends StatefulWidget {
  const VideoViewPage({Key key, this.path, this.orderid}) : super(key: key);
  final dynamic path;
  final dynamic orderid;

  @override
  _VideoViewPageState createState() => _VideoViewPageState();
}

class _VideoViewPageState extends State<VideoViewPage> {
  VideoPlayerController _controller;
  final audioPlayer = AudioPlayer();
  var sellerid;
  bool isLoadig = false;
  @override
  void initState() {
    super.initState();
    //getsellerid();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.audiotrack,
                    size: 27,
                  ),
                  onPressed: () {

                  }),
              IconButton(
                  icon: Icon(
                    Icons.one_x_mobiledata,
                    size: 27,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    Icons.title,
                    size: 27,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 27,
                  ),
                  onPressed: () {}),
            ],
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 150,
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                      : Container(),
                ),
                // Positioned(
                //   bottom: 0,
                //   child: Container(
                //     color: Colors.black38,
                //     width: MediaQuery.of(context).size.width,
                //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                //     child: TextFormField(
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 17,
                //       ),
                //       maxLines: 6,
                //       minLines: 1,
                //       decoration: InputDecoration(
                //           border: InputBorder.none,
                //           hintText: "Add Caption....",
                //           prefixIcon: Icon(
                //             Icons.add_photo_alternate,
                //             color: Colors.white,
                //             size: 27,
                //           ),
                //           hintStyle: TextStyle(
                //             color: Colors.white,
                //             fontSize: 17,
                //           ),
                //           suffixIcon: CircleAvatar(
                //             radius: 27,
                //             backgroundColor: Colors.tealAccent[700],
                //             child: IconButton(
                //               onPressed: () {
                //                // uploadImage();
                //                 // savevideotoserver();
                //               },
                //               icon: isLoadig
                //                   ? CircularProgressIndicator(
                //                 valueColor: new AlwaysStoppedAnimation<Color>(
                //                     Colors.white),
                //               )
                //                   : Icon(
                //                 Icons.check,
                //                 color: Colors.white,
                //                 size: 27,
                //               ),
                //             ),
                //           )),
                //     ),
                //   ),
                // ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: CircleAvatar(
                      radius: 33,
                      backgroundColor: Colors.black38,
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //Audios()
      ],
    );
  }



}