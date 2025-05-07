import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  String apiKey = dotenv.get('API_KEY');
}
