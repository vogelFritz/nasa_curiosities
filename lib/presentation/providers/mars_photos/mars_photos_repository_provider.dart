import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nasa_curiosities/infrastructure/datasources/nasa_mars_photos_datasource.dart';
import 'package:nasa_curiosities/infrastructure/repositories/mars_photos_repository_impl.dart';

final marsPhotosRepositoryProvider = Provider((ref) {
  return MarsPhotosRepositoryImpl(NasaMarsPhotosDatasource());
});
