import 'package:flutter/material.dart';
import 'package:nasa_curiosities/domain/entities/picture.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ApodSwiperItem extends StatefulWidget {
  final Picture apod;
  const ApodSwiperItem({super.key, required this.apod});

  @override
  State<ApodSwiperItem> createState() => _ApodSwiperItemState();
}

class _ApodSwiperItemState extends State<ApodSwiperItem> {
  YoutubePlayerController? youtubeController;

  @override
  void initState() {
    youtubeController = YoutubePlayerController(
        initialVideoId: 'QSivvdIyeG4',
        flags: const YoutubePlayerFlags(autoPlay: true, mute: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: (widget.apod.mediaType == 'video')
              ? YoutubePlayer(
                  controller: youtubeController!,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber)
              : Image.network(widget.apod.url),
        ),
        const Align(
            alignment: Alignment.topLeft,
            child: Text('Astronomy Picture Of The Day',
                style: TextStyle(color: Colors.white)))
      ],
    );
  }
}
