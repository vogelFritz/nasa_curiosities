import 'package:nasa_curiosities/domain/datasources/pictures_datasource.dart';
import 'package:nasa_curiosities/domain/entities/picture.dart';
import 'package:nasa_curiosities/domain/repositories/pictures_repository.dart';

class PictureRepositoryImpl extends PictureRepository {
  final PictureDatasource datasource;
  PictureRepositoryImpl(this.datasource);
  @override
  Future<Picture> getApod() async {
    return datasource.getApod();
  }
}
