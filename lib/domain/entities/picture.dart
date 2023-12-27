class Picture {
  final String title;
  final String copyright;
  final String url;
  final String? explanation;
  final String? date;

  const Picture(
      {required this.url,
      required this.copyright,
      required this.title,
      this.explanation,
      this.date});
}
