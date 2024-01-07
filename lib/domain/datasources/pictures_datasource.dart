import 'package:nasa_curiosities/domain/entities/apod.dart';

abstract class PictureDatasource {
  Future<Apod> getApod();
}
