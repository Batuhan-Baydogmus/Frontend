import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'newappbar.dart';

class Homepage extends StatefulWidget {
  const Homepage();

  @override
  State<Homepage> createState() => _HomePageSegmentState();
}

class _HomePageSegmentState extends State<Homepage> {
  final VideoPlayerController _video =
      VideoPlayerController.asset('assets/videos/back3.mp4');

  @override
  void initState() {
    super.initState();
    _video.setVolume(0);
    _video.setLooping(true);
    _video.play();
    _video.initialize().then((void value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Stack(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
        ),
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: VideoPlayer(_video),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, //for ordering
          children: <Widget>[
            NewAppBar(),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ])),
    );
  }

  @override
  void dispose() {
    _video.dispose();
    super.dispose();
  }
}
