import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key});

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  String urlVideo =
      'https://stream115.otaro.co.th:443/vod/mp4:ung.mp4/playlist.m3u8';

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    initialVideo();
  }

  void initialVideo() {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(urlVideo))
          ..initialize()
          ..play();

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: true,
        aspectRatio: 9 / 16,
        looping: true);
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return SizedBox(
          width: boxConstraints.maxWidth,
          height: boxConstraints.maxHeight,
          child: Chewie(controller: chewieController!),
        );
      }),
    );
  }
}
