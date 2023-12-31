import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_curiosities/domain/entities/mars_photo.dart';
import 'package:nasa_curiosities/presentation/providers/providers.dart';

class MarsPhotosScreen extends ConsumerStatefulWidget {
  static const String name = 'mars-photos-screen';
  const MarsPhotosScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      MarsPhotosScreenState();
}

class MarsPhotosScreenState extends ConsumerState<MarsPhotosScreen> {
  @override
  void initState() {
    super.initState();
    //ref.read(marsPhotosProvider.notifier).getMarsPhotos();
  }

  @override
  Widget build(BuildContext context) {
    final List<MarsPhoto> marsPhotos = ref.watch(marsPhotosProvider);
    return Scaffold(
        body: ListView.builder(
            itemCount: marsPhotos.length,
            itemBuilder: (context, index) =>
                Image.network(marsPhotos[index].imgSrc)),
        floatingActionButton: FloatingActionButton(
            onPressed: () => context.pop(),
            child: const Icon(Icons.arrow_back_ios_new_sharp)));
  }
}
