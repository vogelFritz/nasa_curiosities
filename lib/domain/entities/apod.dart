class Apod {
  final String title;
  final String copyright;
  final String url;
  final String mediaType;
  final String? explanation;
  final String? date;

  const Apod(
      {this.url =
          'https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg',
      this.copyright = 'No copyright',
      this.mediaType = 'image',
      this.title = 'No title',
      this.explanation,
      this.date});
}
