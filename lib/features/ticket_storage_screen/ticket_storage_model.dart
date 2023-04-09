import 'package:elementary/elementary.dart';
import 'package:surf_flutter_study_jam_2023/domain/ticket_domain.dart';
import 'package:surf_flutter_study_jam_2023/interactor/download/download_interactor.dart';
import 'package:surf_flutter_study_jam_2023/repository/tickets_repository.dart';

/// Имплементация Elementary модели к
class TicketStorageScreenModel extends ElementaryModel {
  TicketsRepository _ticketsRepository;
  DownloadInteractor _downloadInteractor;
  TicketStorageScreenModel(
    ErrorHandler errorHandler,
    this._ticketsRepository,
    this._downloadInteractor,
  ) : super(
          errorHandler: errorHandler,
        );

  /// Получить список билетов
  List<TicketDomain> getListTickets() => _ticketsRepository.getAllTickets();

  /// Добавить билет
  void addTicket(TicketDomain ticket) => _ticketsRepository.addTicket(ticket);

  /// Добавить билет
  void updateTicket(TicketDomain ticket) =>
      _ticketsRepository.updateTicket(ticket);

  /// Удалить билет
  void deleteTicket(TicketDomain ticket) =>
      _ticketsRepository.deleteTicket(ticket);

  Future<String?> downloadTicket(
    String url,
    void Function(int, int)? onReceiveProgress,
  ) async =>
      await _downloadInteractor.download(
        url,
        onReceiveProgress,
      );
}
