import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String nasaApiKey = dotenv.env['NASA_API_KEY'] ?? 'No hay api key';
}
