import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'ticket_data.g.dart';

@HiveType(typeId: 0)
class TicketData {
  @HiveField(0)
  String name;
  @HiveField(1)
  String url;
  @HiveField(2)
  String? source;
  @HiveField(3)
  DateTime created;

  TicketData(
    this.name,
    this.url,
    this.source,
    this.created,
  );
}
