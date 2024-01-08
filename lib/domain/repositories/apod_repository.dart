import 'package:nasa_curiosities/domain/entities/apod.dart';

abstract class ApodRepository {
  Future<Apod> getApod();
}
