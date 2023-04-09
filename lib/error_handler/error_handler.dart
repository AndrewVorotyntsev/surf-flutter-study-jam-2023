import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

/// Обработчик ошибок приложения
@singleton
class AppErrorHandler extends ErrorHandler {
  /// Обработать ошибку
  @override
  void handleError(Object error, {StackTrace? stackTrace}) {
    debugPrint(error.toString());
  }
}
