import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nasa_curiosities/infrastructure/datasources/nasa_apod_datasource.dart';
import 'package:nasa_curiosities/infrastructure/repositories/apod_repository_impl.dart';

final apodRepositoryProvider = Provider((ref) {
  return ApodRepositoryImpl(NasaApodDatasource());
});
