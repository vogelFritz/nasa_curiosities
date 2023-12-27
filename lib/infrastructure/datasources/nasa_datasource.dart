import 'package:dio/dio.dart';
import 'package:nasa_curiosities/config/constants/environment.dart';
import 'package:nasa_curiosities/domain/datasources/pictures_datasource.dart';
import 'package:nasa_curiosities/domain/entities/picture.dart';
import 'package:nasa_curiosities/infrastructure/mappers/picture_mapper.dart';
import 'package:nasa_curiosities/infrastructure/models/nasa/nasa_apod_response.dart';

class NasaDatasource extends PictureDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.nasa.gov/',
      queryParameters: {'api_key': Environment.nasaApiKey}));
  @override
  Future<Picture> getApod() async {
    final response = await dio.get('/planetary/apod');
    final nasaApodResponse = NasaApodResponse.fromJson(response.data);
    final Picture picture = PictureMapper.nasaApodToEntity(nasaApodResponse);
    return picture;
  }
}
