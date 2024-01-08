import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nasa_curiosities/domain/entities/mars_photo.dart';
import 'package:nasa_curiosities/presentation/providers/mars_photos/mars_photos_repository_provider.dart';

final marsPhotosProvider =
    StateNotifierProvider<MarsPhotosNotifier, List<MarsPhoto>>((ref) {
  MarsPhotosCallback fetchMarsPhotos =
      ref.watch(marsPhotosRepositoryProvider).getMarsPhotos;
  return MarsPhotosNotifier(fetchMarsPhotos: fetchMarsPhotos);
});

class MarsPhotosNotifier extends StateNotifier<List<MarsPhoto>> {
  MarsPhotosCallback fetchMarsPhotos;
  MarsPhotosNotifier({required this.fetchMarsPhotos}) : super([]);
  Future<void> getMarsPhotos() async {
    final List<MarsPhoto> marsPhotos = await fetchMarsPhotos();
    state = [...state, ...marsPhotos];
  }
}

typedef MarsPhotosCallback = Future<List<MarsPhoto>> Function([int]);
