import 'package:hive/hive.dart';

part 'ticket_data.g.dart';

/// Класс билета для хранения в базе данных
@HiveType(typeId: 0)
class TicketData {
  /// Название билета
  @HiveField(0)
  String name;

  /// Ссылка на билет
  @HiveField(1)
  String url;

  /// Ссылка на локальный файл
  @HiveField(2)
  String? source;

  /// Дата добавления билета
  @HiveField(3)
  DateTime created;

  TicketData(
    this.name,
    this.url,
    this.source,
    this.created,
  );
}
