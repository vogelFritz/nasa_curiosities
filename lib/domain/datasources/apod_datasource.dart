import 'package:nasa_curiosities/domain/entities/apod.dart';

abstract class ApodDatasource {
  Future<Apod> getApod();
}
