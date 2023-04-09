import 'package:injectable/injectable.dart';
import 'package:surf_flutter_study_jam_2023/interactor/download/dio/dio_interactor.dart';

/// Интерактор
abstract class DownloadInteractor {
  /// Скачать файл
  /// Необходимо передать ссылку на файл и колбэк для отслеживания прогресса
  /// Возвращает ссылку на файл в локальном хранилище
  Future<String?> download(
    String url,
    void Function(int, int)? onReceiveProgress,
  );
}

/// Имплементация к классу [DownloadInteractor]
@LazySingleton(as: DownloadInteractor)
class DownloadInteractorImpl extends DownloadInteractor {
  DownloadInteractorImpl(this._dioInteractor);

  DioInteractor _dioInteractor;

  @override
  Future<String?> download(
    String url,
    void Function(int, int)? onReceiveProgress,
  ) async {
    return await _dioInteractor.download(
        url: url, onReceiveProgress: onReceiveProgress);
  }
}
