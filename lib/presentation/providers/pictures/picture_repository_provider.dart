import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nasa_curiosities/infrastructure/datasources/nasa_apod_datasource.dart';
import 'package:nasa_curiosities/infrastructure/datasources/nasa_mars_photos_datasource.dart';
import 'package:nasa_curiosities/infrastructure/repositories/mars_photos_repository_impl.dart';
import 'package:nasa_curiosities/infrastructure/repositories/picture_repository_impl.dart';

final pictureRepositoryProvider = Provider((ref) {
  return PictureRepositoryImpl(NasaApodDatasource());
});

final marsPhotosRepositoryProvider = Provider((ref) {
  return MarsPhotosRepositoryImpl(NasaMarsPhotosDatasource());
});
