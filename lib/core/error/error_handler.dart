import 'package:flutter/cupertino.dart';
import 'package:fsm_app/core/error/app_exception.dart';

import '../../common/helpers/snack_bar/snark_bar_display.dart';
import '../logger/logger.dart';

class ErrorHandler {
  static void handleError(BuildContext context, dynamic error) {
    if (error is AppException) {
    } else {}
  }

  static void _handleAppException(
      BuildContext context, AppException exception) {
    AppLogger.error(exception.toString(), exception.error);
    SnackBarDisplay.showError(context, exception.message);
  }

  static void _handleUnknownError(BuildContext context, dynamic error) {
    AppLogger.error('Unknown error occurred', error);
    SnackBarDisplay.showError(context, 'An unknown error occurred');
  }
}
