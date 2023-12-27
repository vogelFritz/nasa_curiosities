import 'package:nasa_curiosities/domain/entities/picture.dart';

abstract class PictureDatasource {
  Future<Picture> getApod();
}
