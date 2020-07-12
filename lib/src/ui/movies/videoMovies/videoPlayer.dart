import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {

  final YoutubePlayerController controller;

  VideoPlayer({Key key, @required this.controller})
  : super(key:key);
  

  @override
  _VideoPlayerState createState() => _VideoPlayerState(controller);
}

class _VideoPlayerState extends State<VideoPlayer> {
  final YoutubePlayerController controller;

  _VideoPlayerState(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Center(
            child: YoutubePlayer(controller: controller),
          ),
          Positioned(
            top: 40.0,
            right: 20.0,
            child: IconButton(
              icon: Icon(Icons.close), 
              color: Colors.white,
              onPressed: (){
                Navigator.pop(context);
              }
            ),
          )
        ],
      ),

      
    );
  }
}