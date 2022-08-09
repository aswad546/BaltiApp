import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class VideoBuilder extends StatefulWidget {
  const VideoBuilder({Key? key, required this.videoPath}) : super(key: key);
  final String videoPath;

  @override
  State<VideoBuilder> createState() => _VideoBuilderState();
}

class _VideoBuilderState extends State<VideoBuilder> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _onTouch = false;

  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.file(File(widget.videoPath)
        // , videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true)
        );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
    });

    // Use the controller to loop the video.
    _controller.setLooping(true);
    // _controller.play();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    VideoPlayer(_controller),
                    // Here you can also add Overlay capacities
                    Center(
                      child: IconButton(
                        icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause_circle_outline_sharp
                          : Icons.play_circle_outline_sharp,
                      color: Color.fromARGB(255, 199, 197, 197),
                      size: mediaQuery.size.height * 0.07,
                        ),
                        onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                        },
                      ),
                    ),
                  ],
                ));
            // Stack(
            //   children: <Widget>[
            //     VideoPlayer(_controller),

            //     // Add a play or pause button overlay
            //     Center(
            //       child: Visibility(
            //         visible: _onTouch,
            //         child: Container(
            //           color: Colors.grey.withOpacity(0.5),
            //           alignment: Alignment.center,
            //           child: IconButton(
            //             icon: Icon(
            //               _controller.value.isPlaying
            //                   ? Icons.pause
            //                   : Icons.play_arrow,
            //               color: Colors.white,
            //             ),
            //             onPressed: () {
            //               _timer.cancel();

            //               // pause while video is playing, play while video is pausing
            //               setState(() {
            //                 _controller.value.isPlaying
            //                     ? _controller.pause()
            //                     : _controller.play();
            //               });

            //               // Auto dismiss overlay after 1 second

            //               // _timer =
            //               //     Timer.periodic(Duration(milliseconds: 1000), (_) {
            //               //   setState(() {
            //               //     _onTouch = false;
            //               //   });
            //               // });
            //             },
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
