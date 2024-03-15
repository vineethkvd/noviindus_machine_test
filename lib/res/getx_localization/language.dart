import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello',
      'goodbye': 'Goodbye',
      // Add more translations for English (United States) here
    },
    'es_ES': {
      'hello': 'Hola',
      'goodbye': 'Adiós',
      // Add more translations for Spanish (Spain) here
    },
    // Add more languages as needed
  };
}
