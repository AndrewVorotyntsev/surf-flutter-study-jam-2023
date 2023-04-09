import 'package:surf_flutter_study_jam_2023/res/common_strings.dart';

/// Доменная модель для билета
class TicketDomain {
  /// Название билета
  String name;

  /// Ссылка на билет
  String url;

  /// Дата добавления билета
  DateTime created;

  /// Прогресс загрузки файлов на устройство
  double progress;

  TicketDomain(
      {required this.name,
      required this.url,
      required this.created,
      double? progress})
      : progress = progress ?? 0;
}
