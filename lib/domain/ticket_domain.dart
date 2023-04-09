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

  /// Состояние загрузки билета
  StateNotifier<DownloadData> downloadProgressState;

  TicketDomain({
    required this.name,
    required this.url,
    required this.created,
    required this.downloadProgressState,
    this.source,
  });

  /// Установить ссылку на локальный ресурс
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
