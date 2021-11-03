import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController? _controller1;
  VideoPlayerController? _controller2;
  VideoPlayerController? _controller3;
  List<VideoPlayerController> _controller = [];
  bool loading = false;
  @override
  void initState() {
    super.initState();
    _controller1 = VideoPlayerController.asset("assets/video1.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller2 = VideoPlayerController.asset("assets/video2.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller3 = VideoPlayerController.asset("assets/video3.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.add(_controller1!);
    _controller.add(_controller2!);
    _controller.add(_controller3!);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Container(
          color: Colors.black,
          child: ListView.builder(
              itemCount: _controller.length,
              itemBuilder: (context, index) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(children: [
                      _controller[index]!.value.isInitialized
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 70,
                              child: AspectRatio(
                                aspectRatio:
                                    _controller[index]!.value.aspectRatio,
                                child: VideoPlayer(_controller[index]!),
                              ),
                            )
                          : Container(),
                      Positioned(
                          bottom: 90,
                          left: 16,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    child: FloatingActionButton(
                                        backgroundColor: Colors.white,
                                        child: Center(
                                          child: Icon(
                                            Icons.person,
                                            size: 30,
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                        onPressed: () {}),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "kendy_Software",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Filipi 4:8",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            ],
                          )),
                      Positioned(
                          bottom: 90,
                          right: 10,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Ionicons.heart,
                                      // IconToo passes `fontSize: min(trueSize.width, trueSize.height)`,
                                      // the shortest side (here: height), to glyph-rendering TextStyle:
                                    ),
                                  ),
                                  Text("3.100")
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.mode_comment,
                                      // IconToo passes `fontSize: min(trueSize.width, trueSize.height)`,
                                      // the shortest side (here: height), to glyph-rendering TextStyle:
                                    ),
                                  ),
                                  Text("100")
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Ionicons.send
                                        // IconToo passes `fontSize: min(trueSize.width, trueSize.height)`,
                                        // the shortest side (here: height), to glyph-rendering TextStyle:
                                        ),
                                  ),
                                  Text("200")
                                ],
                              )
                            ],
                          )),
                      Positioned(
                        left: 100,
                        right: 100,
                        bottom: 250,
                        top: 250,
                        child: !_controller[index]!.value.isPlaying
                            ? Container(
                                width: 100,
                                height: 100,
                                child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: IconButton(
                                        onPressed: () {
                                          !_controller[index]!.value.isPlaying
                                              ? _controller[index]!.play()
                                              : _controller[index]!.pause();
                                          setState(() {
                                            loading = true;
                                          });
                                        },
                                        icon: Icon(
                                            !_controller[index]!.value.isPlaying
                                                ? Icons.play_arrow
                                                : Icons.pause))))
                            : Container(),
                      )
                    ]));
              }),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     setState(() {
        //       _controller!.value.isPlaying
        //           ? _controller!.pause()
        //           : _controller!.play();
        //     });
        //   },
        //   child: Icon(
        //     _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
        //   ),
        // ),
        bottomSheet: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.black,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              Icon(
                Icons.video_collection,
                color: Colors.white,
              ),
              Icon(
                Ionicons.bag,
                color: Colors.white,
              ),
              Icon(
                Ionicons.person_circle,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller!.dispose();
  // }
}
