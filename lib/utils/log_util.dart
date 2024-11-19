import 'package:logger/logger.dart';

class LogUtil {
  static final Logger _logger = Logger();

  /// Debug 로그.
  ///
  ///
  static void d(String tag, String message) {
    _logger.d("[$tag] $message");
  }

  /// Info 로그.
  ///
  ///
  static void i(String tag, String message) {
    _logger.i("[$tag] $message");
  }

  /// Warning 로그.
  ///
  ///
  static void w(String tag, String message) {
    _logger.w("[$tag] $message");
  }

  /// Error 로그.
  ///
  ///
  static void e(String tag, String message) {
    _logger.e("[$tag] $message");
  }
}
