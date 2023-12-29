// To parse this JSON data, do
//
//     final marsPhotosResponse = marsPhotosResponseFromJson(jsonString);

import 'dart:convert';

MarsPhotosResponse marsPhotosResponseFromJson(String str) =>
    MarsPhotosResponse.fromJson(json.decode(str));

String marsPhotosResponseToJson(MarsPhotosResponse data) =>
    json.encode(data.toJson());

class MarsPhotosResponse {
  final List<Photo> photos;

  MarsPhotosResponse({
    required this.photos,
  });

  factory MarsPhotosResponse.fromJson(Map<String, dynamic> json) =>
      MarsPhotosResponse(
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
      };
}

class Photo {
  final int id;
  final int sol;
  final PhotoCamera camera;
  final String imgSrc;
  final DateTime earthDate;
  final Rover rover;

  Photo({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
    required this.rover,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        sol: json["sol"],
        camera: PhotoCamera.fromJson(json["camera"]),
        imgSrc: json["img_src"],
        earthDate: DateTime.parse(json["earth_date"]),
        rover: Rover.fromJson(json["rover"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sol": sol,
        "camera": camera.toJson(),
        "img_src": imgSrc,
        "earth_date":
            "${earthDate.year.toString().padLeft(4, '0')}-${earthDate.month.toString().padLeft(2, '0')}-${earthDate.day.toString().padLeft(2, '0')}",
        "rover": rover.toJson(),
      };
}

class PhotoCamera {
  final int id;
  final CameraName name;
  final int roverId;
  final FullName fullName;

  PhotoCamera({
    required this.id,
    required this.name,
    required this.roverId,
    required this.fullName,
  });

  factory PhotoCamera.fromJson(Map<String, dynamic> json) => PhotoCamera(
        id: json["id"],
        name: cameraNameValues.map[json["name"]]!,
        roverId: json["rover_id"],
        fullName: fullNameValues.map[json["full_name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": cameraNameValues.reverse[name],
        "rover_id": roverId,
        "full_name": fullNameValues.reverse[fullName],
      };
}

enum FullName {
  CHEMISTRY_AND_CAMERA_COMPLEX,
  FRONT_HAZARD_AVOIDANCE_CAMERA,
  MARS_DESCENT_IMAGER,
  MARS_HAND_LENS_IMAGER,
  MAST_CAMERA,
  NAVIGATION_CAMERA,
  REAR_HAZARD_AVOIDANCE_CAMERA
}

final fullNameValues = EnumValues({
  "Chemistry and Camera Complex": FullName.CHEMISTRY_AND_CAMERA_COMPLEX,
  "Front Hazard Avoidance Camera": FullName.FRONT_HAZARD_AVOIDANCE_CAMERA,
  "Mars Descent Imager": FullName.MARS_DESCENT_IMAGER,
  "Mars Hand Lens Imager": FullName.MARS_HAND_LENS_IMAGER,
  "Mast Camera": FullName.MAST_CAMERA,
  "Navigation Camera": FullName.NAVIGATION_CAMERA,
  "Rear Hazard Avoidance Camera": FullName.REAR_HAZARD_AVOIDANCE_CAMERA
});

enum CameraName { CHEMCAM, FHAZ, MAHLI, MARDI, MAST, NAVCAM, RHAZ }

final cameraNameValues = EnumValues({
  "CHEMCAM": CameraName.CHEMCAM,
  "FHAZ": CameraName.FHAZ,
  "MAHLI": CameraName.MAHLI,
  "MARDI": CameraName.MARDI,
  "MAST": CameraName.MAST,
  "NAVCAM": CameraName.NAVCAM,
  "RHAZ": CameraName.RHAZ
});

class Rover {
  final int id;
  final RoverName name;
  final DateTime landingDate;
  final DateTime launchDate;
  final Status status;
  final int maxSol;
  final DateTime maxDate;
  final int totalPhotos;
  final List<CameraElement> cameras;

  Rover({
    required this.id,
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
    required this.maxSol,
    required this.maxDate,
    required this.totalPhotos,
    required this.cameras,
  });

  factory Rover.fromJson(Map<String, dynamic> json) => Rover(
        id: json["id"],
        name: roverNameValues.map[json["name"]]!,
        landingDate: DateTime.parse(json["landing_date"]),
        launchDate: DateTime.parse(json["launch_date"]),
        status: statusValues.map[json["status"]]!,
        maxSol: json["max_sol"],
        maxDate: DateTime.parse(json["max_date"]),
        totalPhotos: json["total_photos"],
        cameras: List<CameraElement>.from(
            json["cameras"].map((x) => CameraElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": roverNameValues.reverse[name],
        "landing_date":
            "${landingDate.year.toString().padLeft(4, '0')}-${landingDate.month.toString().padLeft(2, '0')}-${landingDate.day.toString().padLeft(2, '0')}",
        "launch_date":
            "${launchDate.year.toString().padLeft(4, '0')}-${launchDate.month.toString().padLeft(2, '0')}-${launchDate.day.toString().padLeft(2, '0')}",
        "status": statusValues.reverse[status],
        "max_sol": maxSol,
        "max_date":
            "${maxDate.year.toString().padLeft(4, '0')}-${maxDate.month.toString().padLeft(2, '0')}-${maxDate.day.toString().padLeft(2, '0')}",
        "total_photos": totalPhotos,
        "cameras": List<dynamic>.from(cameras.map((x) => x.toJson())),
      };
}

class CameraElement {
  final CameraName name;
  final FullName fullName;

  CameraElement({
    required this.name,
    required this.fullName,
  });

  factory CameraElement.fromJson(Map<String, dynamic> json) => CameraElement(
        name: cameraNameValues.map[json["name"]]!,
        fullName: fullNameValues.map[json["full_name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "name": cameraNameValues.reverse[name],
        "full_name": fullNameValues.reverse[fullName],
      };
}

enum RoverName { CURIOSITY }

final roverNameValues = EnumValues({"Curiosity": RoverName.CURIOSITY});

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
