import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_curiosities/domain/entities/picture.dart';
import 'package:nasa_curiosities/presentation/providers/pictures/picture_repository_provider.dart';

final apodProvider = StateNotifierProvider<ApodNotifier, List<Picture>>((ref) {
  final fetchApod = ref.watch(pictureRepositoryProvider).getApod;
  return ApodNotifier(fetchApod: fetchApod);
});

typedef ApodCallback = Future<Picture> Function();

class ApodNotifier extends StateNotifier<List<Picture>> {
  ApodCallback fetchApod;
  ApodNotifier({required this.fetchApod}) : super([]);
  Future<void> getApodPicture() async {
    final Picture apodPicture = await fetchApod();
    state = [...state, apodPicture];
  }
}
