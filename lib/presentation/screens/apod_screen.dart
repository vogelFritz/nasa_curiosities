import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:nasa_curiosities/presentation/providers/providers.dart';

class ApodScreen extends ConsumerWidget {
  static const name = 'apod-screen';
  const ApodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apod = ref.watch(apodProvider);
    final youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(apod.url) ?? 'QSivvdIyeG4',
        flags: const YoutubePlayerFlags(autoPlay: true, mute: false));
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: (apod.mediaType == 'video')
                        ? YoutubePlayer(
                            controller: youtubePlayerController,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.amber)
                        : Image.network(apod.url, fit: BoxFit.cover)),
                const SizedBox(height: 24),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(apod.explanation ?? ''))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back_ios_new_sharp)),
    );
  }
}
