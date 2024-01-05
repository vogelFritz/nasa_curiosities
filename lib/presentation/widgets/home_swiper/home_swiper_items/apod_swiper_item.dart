import 'package:flutter/material.dart';
import 'package:nasa_curiosities/domain/entities/apod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ApodSwiperItem extends StatelessWidget {
  final Apod apod;
  const ApodSwiperItem({super.key, required this.apod});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        (apod.mediaType == 'video')
            ? Image.network(
                YoutubePlayer.getThumbnail(
                    videoId: YoutubePlayer.convertUrlToId(apod.url)!),
                fit: BoxFit.cover)
            : Image.network(apod.url),
        const Positioned(
            top: 10,
            left: 15,
            child: Text('Astronomy Picture Of The Day',
                style: TextStyle(color: Colors.white)))
      ],
    );
  }
}
