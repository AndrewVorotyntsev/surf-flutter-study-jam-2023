import 'package:surf_flutter_study_jam_2023/res/common_strings.dart';

/// Доменная модель для билета
class Ticket {
  /// Название билета
  String name;

  /// Ссылка на билет
  String url;

  /// Дата добавления билета
  DateTime created;

  Ticket({
    required this.name,
    required this.url,
    required this.created,
  });
}
