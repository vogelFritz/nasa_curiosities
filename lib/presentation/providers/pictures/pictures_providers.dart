import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_curiosities/domain/entities/mars_photo.dart';
import 'package:nasa_curiosities/domain/entities/apod.dart';
import 'package:nasa_curiosities/presentation/providers/pictures/picture_repository_provider.dart';

final apodProvider = StateNotifierProvider<ApodNotifier, List<Apod>>((ref) {
  final fetchApod = ref.watch(pictureRepositoryProvider).getApod;
  return ApodNotifier(fetchApod: fetchApod);
});

typedef ApodCallback = Future<Apod> Function();

class ApodNotifier extends StateNotifier<List<Apod>> {
  ApodCallback fetchApod;

  ApodNotifier({required this.fetchApod}) : super([]);
  Future<void> getApodPicture() async {
    final Apod apodPicture = await fetchApod();
    state = [...state, apodPicture];
  }
}

typedef MarsPhotosCallback = Future<List<MarsPhoto>> Function();

final marsPhotosProvider =
    StateNotifierProvider<MarsPhotosNotifier, List<MarsPhoto>>((ref) {
  MarsPhotosCallback fetchMarsPhotos =
      ref.watch(pictureRepositoryProvider).getMarsPhotos;
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
