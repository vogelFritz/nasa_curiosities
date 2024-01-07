import 'package:dio/dio.dart';

import 'package:nasa_curiosities/config/constants/environment.dart';

import 'package:nasa_curiosities/domain/datasources/mars_photos_datasource.dart';
import 'package:nasa_curiosities/domain/entities/mars_photo.dart';
import 'package:nasa_curiosities/infrastructure/models/nasa/mars_photos.dart';
import 'package:nasa_curiosities/infrastructure/mappers/mars_photo_mapper.dart';

class NasaMarsPhotosDatasource implements MarsPhotosDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.nasa.gov',
      queryParameters: {'api_key': Environment.nasaApiKey}));

  @override
  Future<List<MarsPhoto>> getMarsPhotos([int page = 1]) async {
    final response = await dio.get(
        '/mars-photos/api/v1/rovers/curiosity/photos',
        queryParameters: {'page': page, 'sol': 0});
    final marsPhotosResponse = MarsPhotosResponse.fromJson(response.data);
    List<MarsPhoto> marsPhotos = [];
    for (Photo photo in marsPhotosResponse.photos) {
      marsPhotos.add(MarsPhotoMapper.marsPhotoToEntity(photo));
    }
    return marsPhotos;
  }
}
