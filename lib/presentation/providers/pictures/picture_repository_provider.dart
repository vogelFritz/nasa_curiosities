import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_curiosities/infrastructure/datasources/nasa_datasource.dart';
import 'package:nasa_curiosities/infrastructure/repositories/picture_repository_impl.dart';

final pictureRepositoryProvider = Provider((ref) {
  return PictureRepositoryImpl(NasaDatasource());
});