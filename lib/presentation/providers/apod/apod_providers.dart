import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nasa_curiosities/domain/entities/apod.dart';
import 'package:nasa_curiosities/presentation/providers/apod/apod_repository_provider.dart';

final apodProvider = StateNotifierProvider<ApodNotifier, Apod>((ref) {
  final fetchApod = ref.watch(apodRepositoryProvider).getApod;
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
