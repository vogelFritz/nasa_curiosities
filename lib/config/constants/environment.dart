import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static Future<void> loadEnvironmentVariables() async {
    await dotenv.load(fileName: '.env');
  }

  static String nasaApiKey = dotenv.env['NASA_API_KEY'] ?? 'No hay api key';
}
