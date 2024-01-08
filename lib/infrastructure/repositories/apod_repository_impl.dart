import 'package:nasa_curiosities/domain/datasources/apod_datasource.dart';
import 'package:nasa_curiosities/domain/entities/apod.dart';
import 'package:nasa_curiosities/domain/repositories/apod_repository.dart';

class ApodRepositoryImpl implements ApodRepository {
  final ApodDatasource datasource;
  ApodRepositoryImpl(this.datasource);
  @override
  Future<Apod> getApod() {
    return datasource.getApod();
  }
}
