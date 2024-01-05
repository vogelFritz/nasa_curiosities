import 'package:nasa_curiosities/domain/entities/mars_photo.dart';
import 'package:nasa_curiosities/domain/entities/apod.dart';

abstract class PictureRepository {
  Future<Apod> getApod();
  Future<List<MarsPhoto>> getMarsPhotos();
}
