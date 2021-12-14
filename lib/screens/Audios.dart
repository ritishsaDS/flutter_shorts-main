import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shorts/Camerascreen.dart';
import 'package:just_audio/just_audio.dart';

class Audios extends StatefulWidget{

  @override
  _AudiosState createState() => _AudiosState();
}
const kUrl1 = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
const kUrl2 = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
const kUrl3 = 'http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p';

class _AudiosState extends State<Audios> {


  final audioPlayer = AudioPlayer();


  void initState() {
    super.initState();
    // _playerController.setCompleteDuration(0);
    // _playerController.setIsRepeat(false);
    //
    // _playerController.setTotalDuration(100);
    //
    //
    // playAudio();
  }

//   Future<void> playAudio() async {
//
//     Duration duration = await audioPlayer.setUrl(
// "https://luan.xyz/files/audio/ambient_c_motion.mp3"
//     ) ;
//     audioPlayer.play();
//
//     _playerController.setIsPlay(true);
//
//     _playerController.setTotalDuration(duration.inSeconds);
//
//     audioPlayer.createPositionStream().listen((event) {
//       _playerController.setCompleteDuration(event.inSeconds);
//
//       if (event.inSeconds >= duration.inSeconds) {
//         if (_playerController.isRepeat.value) {
//           audioPlayer.seek(Duration());
//           return;
//         }
//         _playerController.setIsPlay(false);
//       }
//     });
//   }

  @override
  void dispose() {
    audioPlayer?.stop();
    audioPlayer?.dispose();

    super.dispose();
  }

  Duration convertIntToDuration(int value) {
    int second = (value % 60).floor();
    int minute = (value / 60).floor();
    int hour = (minute / 60).floor();
    return Duration(hours: hour, minutes: minute, seconds: second);
  }

  String convertDurationString(int value) {
    int second = (value % 60).floor();
    int minute = (value / 60).floor();
    int hours = (minute / 60).floor();
    if (hours == 0) {
      return set0Value(minute) + ':' + set0Value(second);
    } else {
      return set0Value(hours) +
          ':' +
          set0Value(minute) +
          ':' +
          set0Value(second);
    }
  }

  String set0Value(int value) {
    if (value < 10) {
      return '0$value';
    } else {
      return value.toString();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(


        child: Container(
          margin: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Songs List : ",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
SizedBox(height: 20,),
              Divider(thickness: 1.5,height: 10,),
            GestureDetector(
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraScreen()));
                  // Future.delayed(Duration(seconds: 1),() {
                  //   audioPlayer.setUrl(
                  //       "https://cdnsongs.com/dren/music/data/Punjabi/201406/Punjab_1984/128/Swaah_Ban_Ke.mp3/Swaah%20Ban%20Ke.mp3"
                  //   ) ;
                  //   audioPlayer.play();
                  //   });




                },
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      child: Text("F",style: TextStyle(color:Colors.white),),
                    ),
                    Text("Fukre Na",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
                  Icon(Icons.arrow_forward_ios_rounded)
                  ],
                )),
              Divider(thickness: 1.5,height: 10,),
              GestureDetector(
                  onTap: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraScreen()));
                    Future.delayed(Duration(seconds: 2),() {
                      audioPlayer.setUrl(
                          "https://cdnsongs.com/dren/music/data/Punjabi/201406/Punjab_1984/128/Swaah_Ban_Ke.mp3/Swaah%20Ban%20Ke.mp3"
                      ) ;
                      audioPlayer.play();
                    });




                  },
                  child:      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: Text("W",style: TextStyle(color:Colors.white),),
                      ),
                      Text("We Rollin",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  )),
              Divider(thickness: 1.5,height: 10,),
              GestureDetector(
                  onTap: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraScreen()));
                    Future.delayed(Duration(seconds: 2),() {
                      // audioPlayer.setUrl(
                      //     "https://cdnsongs.com/dren/music/data/Punjabi/201406/Punjab_1984/128/Swaah_Ban_Ke.mp3/Swaah%20Ban%20Ke.mp3"
                      // ) ;
                      // audioPlayer.play();
                    });




                  },
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: Text("D",style: TextStyle(color:Colors.white),),
                      ),
                      Text("Dhakka Karde",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  )),
              Divider(thickness: 1.5,height: 10,),
              GestureDetector(
                  onTap: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraScreen()));
                    Future.delayed(Duration(seconds: 2),() {
                      audioPlayer.setUrl(
                          "https://cdnsongs.com/dren/music/data/Punjabi/201406/Punjab_1984/128/Swaah_Ban_Ke.mp3/Swaah%20Ban%20Ke.mp3"
                      ) ;
                      audioPlayer.play();
                    });




                  },
                  child:      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: Text("B",style: TextStyle(color:Colors.white),),
                      ),
                      Text("Banda Ban Ja",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  )),
              Divider(thickness: 1.5,height: 10,),
          ],),
        ),
      ),
    );
  }
}