import 'package:nasa_curiosities/domain/entities/mars_photo.dart' as entity;
import 'package:nasa_curiosities/infrastructure/models/nasa/mars_photos.dart';

class MarsPhotoMapper {
  static marsPhotoToEntity(Photo marsPhotoResponse) => entity.MarsPhoto(
      id: marsPhotoResponse.id,
      sol: marsPhotoResponse.sol,
      imgSrc: marsPhotoResponse.imgSrc,
      rover: entity.Rover(
          id: marsPhotoResponse.rover.id,
          totalPhotos: marsPhotoResponse.rover.totalPhotos));
}
