import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nasa_curiosities/domain/entities/mars_photo.dart';
import 'package:nasa_curiosities/domain/entities/apod.dart';
import 'package:nasa_curiosities/presentation/providers/pictures/picture_repository_provider.dart';

final apodProvider = StateNotifierProvider<ApodNotifier, Apod>((ref) {
  final fetchApod = ref.watch(pictureRepositoryProvider).getApod;
  return ApodNotifier(fetchApod: fetchApod);
});

class ApodNotifier extends StateNotifier<Apod> {
  ApodCallback fetchApod;

  ApodNotifier({required this.fetchApod}) : super(const Apod());

  Future<void> getApodPicture() async {
    final Apod apodPicture = await fetchApod();
    state = apodPicture;
  }
}

typedef ApodCallback = Future<Apod> Function();

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
