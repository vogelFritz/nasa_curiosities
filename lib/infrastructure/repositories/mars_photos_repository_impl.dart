import 'package:nasa_curiosities/domain/datasources/mars_photos_datasource.dart';
import 'package:nasa_curiosities/domain/entities/mars_photo.dart';
import 'package:nasa_curiosities/domain/repositories/mars_photos_repository.dart';

class MarsPhotosRepositoryImpl implements MarsPhotosRepository {
  final MarsPhotosDatasource datasource;
  MarsPhotosRepositoryImpl(this.datasource);
  @override
  Future<List<MarsPhoto>> getMarsPhotos([int page = 1]) {
    return datasource.getMarsPhotos(page);
  }
}
