import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_curiosities/domain/entities/picture.dart';

final apodProvider = StateNotifierProvider<ApodNotifier, List<Picture>>((ref) {
  return ApodNotifier();
});

class ApodNotifier extends StateNotifier<List<Picture>> {
  ApodNotifier() : super([]);
}
