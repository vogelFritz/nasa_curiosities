import 'package:nasa_curiosities/domain/datasources/pictures_datasource.dart';
import 'package:nasa_curiosities/domain/entities/apod.dart';
import 'package:nasa_curiosities/domain/repositories/pictures_repository.dart';

class PictureRepositoryImpl implements PictureRepository {
  final PictureDatasource datasource;
  PictureRepositoryImpl(this.datasource);
  @override
  Future<Apod> getApod() {
    return datasource.getApod();
  }
}
