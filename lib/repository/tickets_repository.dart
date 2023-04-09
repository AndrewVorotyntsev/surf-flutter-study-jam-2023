import 'dart:io';

import 'package:elementary/elementary.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:surf_flutter_study_jam_2023/db/ticket_data.dart';
import 'package:surf_flutter_study_jam_2023/domain/ticket_domain.dart';
import 'package:surf_flutter_study_jam_2023/res/common_strings.dart';
import 'package:surf_flutter_study_jam_2023/utils/download_helper.dart';

/// Репозиторий для работы с билетами
abstract class TicketsRepository {
  /// Добавить билет
  void addTicket(TicketDomain ticket);

  /// Получить все билеты
  List<TicketDomain> getAllTickets();

  /// Удалить билет
  void deleteTicket(TicketDomain ticket);

  /// Обновить билет
  void updateTicket(TicketDomain ticket);
}

/// Имплементация к [TicketsRepository]
@Injectable(as: TicketsRepository)
class TicketsRepositoryImpl extends TicketsRepository {
  TicketsRepositoryImpl();

  Box<TicketData> get _ticketsBox => Hive.box<TicketData>(contactsBoxName);

  @override
  void addTicket(TicketDomain ticket) {
    _ticketsBox.add(
      TicketData(
        ticket.name,
        ticket.url,
        ticket.source,
        ticket.created,
      ),
    );
  }

  @override
  void deleteTicket(TicketDomain ticket) {
    List<TicketData>? list = _ticketsBox.values.toList();
    int index = list.indexWhere((element) => element.created == ticket.created);
    TicketData ticketData = list[index];
    ticketData.source = ticket.source;
    _ticketsBox.deleteAt(index);
    if (ticket.source != null) {
      File fileToDelete = File(ticket.source!);
      fileToDelete.delete();
    }
  }

  @override
  List<TicketDomain> getAllTickets() {
    List<TicketData> localTickets = _ticketsBox.values.toList();
    List<TicketDomain> localTicketsDomain = [];

    for (final ticket in localTickets) {
      DownloadStatus? status;
      if (ticket.source != null) {
        status = DownloadStatus.downloaded;
      } else {
        status = DownloadStatus.waiting;
      }
      localTicketsDomain.add(
        TicketDomain(
          name: ticket.name,
          url: ticket.url,
          created: ticket.created,
          source: ticket.source,
          downloadProgressState: StateNotifier<DownloadData>(
            initValue: DownloadData(status: status),
          ),
        ),
      );
    }
    return localTicketsDomain;
  }

  @override
  void updateTicket(TicketDomain ticket) {
    List<TicketData>? list = _ticketsBox.values.toList();
    int index = list.indexWhere((element) => element.created == ticket.created);
    TicketData ticketData = list[index];
    ticketData.source = ticket.source;
    _ticketsBox.putAt(index, ticketData);
  }
}
