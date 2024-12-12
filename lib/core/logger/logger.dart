import 'logger_config.dart';

class AppLogger {
  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    LoggerConfig.logger.d(message, error: error, stackTrace: stackTrace);
  }

  static void info(String message) {
    LoggerConfig.logger.i(message);
  }

  static void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    LoggerConfig.logger.w(message, error: error, stackTrace: stackTrace);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    LoggerConfig.logger.e(message, error: error, stackTrace: stackTrace);
  }

  static void fatal(String message, [dynamic error, StackTrace? stackTrace]) {
    LoggerConfig.logger.wtf(message, error: error, stackTrace: stackTrace);
  }

  static void verbose(String message) {
    LoggerConfig.logger.v(message);
  }
}
