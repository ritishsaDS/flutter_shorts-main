import 'dart:math';
import 'package:audio_service/audio_service.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shorts/videoview.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'Cameraview.dart';


class CameraScreen extends StatefulWidget {


  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription> cameras;

  CameraController _cameraController;
  Future<void> cameraValue;
  final audioPlayer = AudioPlayer();
  bool isRecoring = false;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;
  int selectedCameraIdx;

  @override
  void initState() {
    super.initState();

    availableCameras().then((availableCameras) async {
      cameras = availableCameras;

      _cameraController = CameraController(cameras[0], ResolutionPreset.high);
      cameraValue = _cameraController.initialize();
      await _cameraController.startVideoRecording().then((value) {
      });
      if (cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            FutureBuilder(
                future: cameraValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: CameraPreview(_cameraController));
                  } else {
                    return Center(
                      child: Text("Hold Icon to record video",style: TextStyle(color: Colors.black),),
                    );
                  }
                }),
            Positioned(
              bottom: 0.0,
              child: Container(
                color:!isRecoring? Colors.black:Colors.transparent,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            icon: Icon(
                              flash ? Icons.flash_on : Icons.flash_off,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: () {
                              setState(() {
                                flash = !flash;
                              });
                              flash
                                  ? _cameraController
                                  .setFlashMode(FlashMode.torch)
                                  : _cameraController.setFlashMode(FlashMode.off);
                            }),
                        GestureDetector(
                          onLongPress: () async {
                            await _cameraController.startVideoRecording();
                            setState(() {
                              isRecoring = true;
                            });
                            audioPlayer.setUrl(
                                "https://cdnsongs.com/dren/music/data/Punjabi_Movies/201403/Jihne_Mera_Dil_Luteya__Pormo_/128/Fukre_1.mp3/Fukre.mp3"
                            ) ;
                            audioPlayer.play();
                          },
                          onLongPressUp: () async {
                            XFile videopath =
                            await _cameraController.stopVideoRecording();
                            setState(() {
                              isRecoring = false;
                            });
                            print(videopath.path);
                            print("videopath");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => VideoViewPage(
                                      path: videopath.path,

                                    )));
                          },
                          onTap: () {
                            // if (!isRecoring) takePhoto(context);
                          },
                          child: isRecoring
                              ? Icon(
                            Icons.radio_button_on,
                            color: Colors.red,
                            size: 80,
                          )
                              : Icon(
                            Icons.panorama_fish_eye,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                        IconButton(
                            icon: Transform.rotate(
                              angle: transform,
                              child: Icon(
                                Icons.flip_camera_ios,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                iscamerafront = !iscamerafront;
                                transform = transform + pi;
                              });
                              int cameraPos = iscamerafront ? 0 : 1;
                              _cameraController = CameraController(
                                  cameras[cameraPos], ResolutionPreset.high);
                              cameraValue = _cameraController.initialize();
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Hold for Video, tap for photo",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    XFile file = await _cameraController.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraViewPage(
              path: file.path,
            )));
  }
}
