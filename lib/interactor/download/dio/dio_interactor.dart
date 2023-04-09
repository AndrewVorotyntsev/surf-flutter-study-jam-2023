import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

/// Модуль для работы с Dio
@module
abstract class DioModule {
  @lazySingleton
  Dio getDio() => Dio();
}

/// Интерактор для работы с Dio
@singleton
class DioInteractor {
  final Dio dio;

  DioInteractor(Dio this.dio);

  /// Скачать файл
  ///
  /// [url] - ссылка на файл
  /// [onReceiveProgress] - колбэк для отслеживания прогресса
  ///
  /// Возвращает ссылку на файл в локальном хранилище
  Future<String> download({
    required String url,
    required void Function(int, int)? onReceiveProgress,
  }) async {
    Uri encodedUrl = Uri.parse(url);

    /// Получаем название файла
    String? filename = encodedUrl.pathSegments.last;

    /// Получаем локальный путь до файла
    String? filePath =
        '${(await getApplicationDocumentsDirectory()).path}/$filename';

    try {
      await dio.download(
        url,
        filePath,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      rethrow;
    }

    return filePath;
  }
}
