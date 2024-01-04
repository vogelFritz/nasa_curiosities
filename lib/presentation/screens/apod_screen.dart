import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_curiosities/presentation/providers/providers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ApodScreen extends ConsumerWidget {
  static const name = 'apod-screen';
  const ApodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apod = ref.watch(apodProvider).first;
    final youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(apod.url) ?? 'QSivvdIyeG4',
        flags: const YoutubePlayerFlags(autoPlay: true, mute: false));
    return Scaffold(
      body: Column(
        children: [
          (apod.mediaType == 'video')
              ? YoutubePlayer(
                  controller: youtubePlayerController,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber)
              : Image.network(apod.url),
          Text(apod.explanation ?? '')
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back_ios_new_sharp)),
    );
  }
}
