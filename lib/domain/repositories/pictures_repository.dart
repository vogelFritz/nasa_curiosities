import 'package:nasa_curiosities/domain/entities/mars_photo.dart';
import 'package:nasa_curiosities/domain/entities/picture.dart';

abstract class PictureRepository {
  Future<Picture> getApod();
  Future<List<MarsPhoto>> getMarsPhotos();
}
