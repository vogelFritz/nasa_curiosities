import 'package:nasa_curiosities/domain/entities/apod.dart';

abstract class PictureRepository {
  Future<Apod> getApod();
}
