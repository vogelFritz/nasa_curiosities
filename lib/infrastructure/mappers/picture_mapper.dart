import 'package:nasa_curiosities/domain/entities/picture.dart';
import 'package:nasa_curiosities/infrastructure/models/nasa/nasa_apod_response.dart';

class PictureMapper {
  static Picture nasaApodToEntity(NasaApodResponse nasaApod) => Picture(
      url: nasaApod.url,
      copyright: nasaApod.url,
      title: nasaApod.title,
      explanation: nasaApod.explanation);
}
