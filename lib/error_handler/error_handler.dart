import 'package:elementary/elementary.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppErrorHandler extends ErrorHandler {
  @override
  void handleError(Object error, {StackTrace? stackTrace}) {
    print(error);
  }
}
