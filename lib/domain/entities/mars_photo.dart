class MarsPhoto {
  final int id;
  final int sol;
  final String imgSrc;
  final Rover rover;
  MarsPhoto(
      {required this.id,
      required this.sol,
      required this.imgSrc,
      required this.rover});
}

class Rover {
  final int id;
  final int totalPhotos;
  Rover({required this.id, required this.totalPhotos});
}
