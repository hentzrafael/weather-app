import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  String _apiKey = '';

  String get apiKey => _apiKey;
  set apiKey(String value) => _apiKey = value;

  Environment() {
    _apiKey = dotenv.get('API_KEY');
  }
}
