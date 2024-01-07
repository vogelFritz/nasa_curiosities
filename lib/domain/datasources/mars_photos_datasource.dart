import 'package:nasa_curiosities/domain/entities/mars_photo.dart';

abstract class MarsPhotosDatasource {
  Future<List<MarsPhoto>> getMarsPhotos([int page = 1]);
}
