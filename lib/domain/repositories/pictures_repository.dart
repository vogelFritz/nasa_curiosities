import 'package:nasa_curiosities/domain/entities/picture.dart';

abstract class PictureRepository {
  Future<Picture> getApod();
}
