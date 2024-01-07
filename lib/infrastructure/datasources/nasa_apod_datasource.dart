import 'package:dio/dio.dart';

import 'package:nasa_curiosities/config/constants/environment.dart';

import 'package:nasa_curiosities/domain/datasources/apod_datasource.dart';

import 'package:nasa_curiosities/domain/entities/apod.dart';

import 'package:nasa_curiosities/infrastructure/mappers/apod_mapper.dart';
import 'package:nasa_curiosities/infrastructure/models/nasa/nasa_apod_response.dart';

class NasaApodDatasource implements ApodDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.nasa.gov/',
      queryParameters: {'api_key': Environment.nasaApiKey}));

  @override
  Future<Apod> getApod() async {
    final response = await dio.get('/planetary/apod');
    final nasaApodResponse = NasaApodResponse.fromJson(response.data);
    final Apod picture = ApodMapper.nasaApodToEntity(nasaApodResponse);
    return picture;
  }
}
