// To parse this JSON data, do
//
//     final nasaApodResponse = nasaApodResponseFromJson(jsonString);

// import 'dart:convert';
//
// NasaApodResponse nasaApodResponseFromJson(String str) =>
//     NasaApodResponse.fromJson(json.decode(str));
//
// String nasaApodResponseToJson(NasaApodResponse data) =>
//     json.encode(data.toJson());

class NasaApodResponse {
  final String copyright;
  final DateTime date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  NasaApodResponse({
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  factory NasaApodResponse.fromJson(Map<String, dynamic> json) =>
      NasaApodResponse(
        copyright: json["copyright"],
        date: DateTime.parse(json["date"]),
        explanation: json["explanation"],
        hdurl: json["hdurl"],
        mediaType: json["media_type"],
        serviceVersion: json["service_version"],
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "copyright": copyright,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "explanation": explanation,
        "hdurl": hdurl,
        "media_type": mediaType,
        "service_version": serviceVersion,
        "title": title,
        "url": url,
      };
}
