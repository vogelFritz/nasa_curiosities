class Apod {
  final String title;
  final String copyright;
  final String url;
  final String mediaType;
  final String? explanation;
  final String? date;

  const Apod(
      {required this.url,
      required this.copyright,
      required this.mediaType,
      required this.title,
      this.explanation,
      this.date});
}
