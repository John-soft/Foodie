import 'package:logger/logger.dart';

void logger(dynamic message) {
  var logger = Logger();
  return logger.d(message);
}
