import 'package:nasa_curiosities/domain/entities/apod.dart';
import 'package:nasa_curiosities/infrastructure/models/nasa/nasa_apod_response.dart';

class PictureMapper {
  static Apod nasaApodToEntity(NasaApodResponse nasaApod) => Apod(
      url: nasaApod.url,
      mediaType: nasaApod.mediaType,
      copyright: nasaApod.url,
      title: nasaApod.title,
      explanation: nasaApod.explanation);
}
