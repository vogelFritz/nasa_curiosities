import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_curiosities/domain/entities/mars_photo.dart';
import 'package:nasa_curiosities/presentation/providers/providers.dart';

class MarsPhotosScreen extends ConsumerWidget {
  static const String name = 'mars-photos-screen';
  const MarsPhotosScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MarsPhoto> marsPhotos = ref.watch(marsPhotosProvider);
    return Scaffold(
        body: ListView.builder(
            itemCount: marsPhotos.length,
            itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Image.network(marsPhotos[index].imgSrc,
                        fit: BoxFit.cover),
                  ),
                )),
        floatingActionButton: FloatingActionButton(
            onPressed: () => context.pop(),
            child: const Icon(Icons.arrow_back_ios_new_sharp)));
  }
}
