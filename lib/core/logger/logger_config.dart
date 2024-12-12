import 'package:logger/logger.dart';

class LoggerConfig {
  static final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Số lượng stacktrace
      errorMethodCount: 8, // Số lượng stacktrace cho lỗi
      lineLength: 120, // Độ dài dòng log
      colors: true, // Hiển thị màu sắc
      printEmojis: true, // Thêm emoji
      printTime: true, // Hiển thị thời gian
    ),
  );

  static void init() {
    Logger.level = Level.debug;
  }
}
