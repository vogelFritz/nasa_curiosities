import 'package:dio/dio.dart';
import 'package:nasa_curiosities/config/constants/environment.dart';
import 'package:nasa_curiosities/domain/datasources/pictures_datasource.dart';
import 'package:nasa_curiosities/domain/entities/mars_photo.dart';
import 'package:nasa_curiosities/domain/entities/picture.dart';
import 'package:nasa_curiosities/infrastructure/mappers/mars_photo_mapper.dart';
import 'package:nasa_curiosities/infrastructure/mappers/picture_mapper.dart';
import 'package:nasa_curiosities/infrastructure/models/nasa/mars_photos.dart';
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

  @override
  Future<List<MarsPhoto>> getMarsPhotos() async {
    final response = await dio.get(
        '/mars-photos/api/v1/rovers/curiosity/photos',
        queryParameters: {'sol': 1000});
    final marsPhotosResponse = MarsPhotosResponse.fromJson(response.data);
    List<MarsPhoto> marsPhotos = [];
    for (Photo photo in marsPhotosResponse.photos) {
      marsPhotos.add(MarsPhotoMapper.marsPhotoToEntity(photo));
    }
    return marsPhotos;
  }
}
