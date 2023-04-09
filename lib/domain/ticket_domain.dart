import 'package:elementary/elementary.dart';
import 'package:surf_flutter_study_jam_2023/utils/download_helper.dart';

/// Доменная модель для билета
class TicketDomain {
  /// Название билета
  String name;

  /// Ссылка на билет
  String url;

  /// Ссылка на локальный файл
  String? source;

  /// Дата добавления билета
  DateTime created;

  /// Прогресс загрузки файлов на устройство
  double progress;

  ///
  StateNotifier<DownloadData> downloadProgressState;

  TicketDomain(
      {required this.name,
      required this.url,
      required this.created,
      required this.downloadProgressState,
      this.source,
      double? progress})
      : progress = progress ?? 0;

  TicketDomain setSource({String? source}) {
    return TicketDomain(
      name: name,
      url: url,
      created: created,
      downloadProgressState: downloadProgressState,
      source: source,
    );
  }
}
