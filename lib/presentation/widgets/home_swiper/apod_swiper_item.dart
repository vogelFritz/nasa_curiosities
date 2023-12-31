import 'package:flutter/material.dart';
import 'package:nasa_curiosities/domain/entities/picture.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ApodSwiperItem extends StatelessWidget {
  final Picture apod;
  const ApodSwiperItem({super.key, required this.apod});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: (apod.mediaType == 'video')
              ? Image.network(YoutubePlayer.getThumbnail(
                  videoId: YoutubePlayer.convertUrlToId(apod.url)!))
              : Image.network(apod.url),
        ),
        const Align(
            alignment: Alignment.topLeft,
            child: Text('Astronomy Picture Of The Day',
                style: TextStyle(color: Colors.white)))
      ],
    );
  }
}
