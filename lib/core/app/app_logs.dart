import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger();

  static void log(String message) {
    _logger.i(message);
  }
}
