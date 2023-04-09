import 'package:injectable/injectable.dart';
import 'package:surf_flutter_study_jam_2023/domain/ticket.dart';

/// Репозиторий для работы с билетами
abstract class TicketsRepository {
  /// Добавить билет
  void addTicket(TicketDomain ticket);

  /// Получить все билеты
  void getAllTickets();

  /// Удалить билет
  void deleteTicket();
}

// /// Имплементация к [TicketsRepository]
// @Injectable(as: TicketsRepository)
// class TicketsRepositoryImpl extends TicketsRepository {
//   TicketsRepositoryImpl();
//
// }
