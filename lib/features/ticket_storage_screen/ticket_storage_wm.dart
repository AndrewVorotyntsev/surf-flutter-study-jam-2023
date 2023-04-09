import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/di/di_container.dart';
import 'package:surf_flutter_study_jam_2023/domain/ticket_domain.dart';
import 'package:surf_flutter_study_jam_2023/error_handler/error_handler.dart';
import 'package:surf_flutter_study_jam_2023/features/pdf_view/pdf_view_screen.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage_screen/ticket_storage_model.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage_screen/ticket_storage_screen.dart';
import 'package:surf_flutter_study_jam_2023/interactor/download/download_interactor.dart';
import 'package:surf_flutter_study_jam_2023/repository/tickets_repository.dart';
import 'package:surf_flutter_study_jam_2023/uikit/popup/show_popup.dart';
import 'package:surf_flutter_study_jam_2023/uikit/ticket_dialog.dart';
import 'package:surf_flutter_study_jam_2023/utils/download_helper.dart';

/// Абстракция Widget Model
abstract class ITicketStorageWidgetModel extends IWidgetModel {
  /// Состояние пролистывания до конца списка
  StateNotifier<bool> get isEndScrollState;

  /// Состояние списка билетов
  ListenableState<EntityState<List<TicketDomain>>> get ticketsListState;

  /// Контроллер для скрола списка
  ScrollController get ticketsListScrollController;

  /// Контроллер для ввода ссылки
  TextEditingController get urlController;

  /// Контроллер для ввода названия билета
  TextEditingController get nameController;

  void showAddNewTicketDialog();

  void deleteTicket(TicketDomain ticket);

  void downloadTicket(TicketDomain ticket);
}

TicketStorageWidgetModel defaultAppWidgetModelFactory(BuildContext context) {
  return TicketStorageWidgetModel(
    TicketStorageScreenModel(
      getIt.get<AppErrorHandler>(),
      getIt.get<TicketsRepository>(),
      getIt.get<DownloadInteractor>(),
    ),
  );
}

/// Имплементация и реализация Виджет модели [IHomeUserProfileWidgetModel]
class TicketStorageWidgetModel
    extends WidgetModel<TicketStorageScreen, TicketStorageScreenModel>
    implements ITicketStorageWidgetModel {
  TicketStorageWidgetModel(TicketStorageScreenModel model) : super(model);

  @override
  StateNotifier<bool> isEndScrollState = StateNotifier<bool>(initValue: false);

  @override
  late ScrollController ticketsListScrollController;

  @override
  ListenableState<EntityState<List<TicketDomain>>> get ticketsListState =>
      _ticketsList;

  final _ticketsList = EntityStateNotifier<List<TicketDomain>>();

  @override
  final TextEditingController urlController = TextEditingController();

  @override
  final TextEditingController nameController = TextEditingController();

  @override
  void initWidgetModel() {
    final localTicketsList = model.getListTickets();
    _ticketsList.accept(EntityState(data: localTicketsList));

    ticketsListScrollController = ScrollController();
    ticketsListScrollController.addListener(_ticketsListScrollListener);
    super.initWidgetModel();
  }

  @override
  void showAddNewTicketDialog() {
    showPopUp(
      context,
      NewTicketDialog(
        nameController: nameController,
        urlController: urlController,
        onAddTapped: _addNewTicket,
      ),
    );
  }

  @override
  void downloadTicket(TicketDomain ticket) async {
    String? filePath = await model.downloadTicket(ticket.url,
        (int count, int total) => onReceiveProgress(ticket, count, total));
    // if (filePath != null) {
    //   Navigator.of(context).push(PdfViewScreenRoute(filePath));
    // }
  }

  void onReceiveProgress(
    TicketDomain ticket,
    int count,
    int total,
  ) {
    ticket.downloadProgressState.accept(DownloadData(
      count,
      total,
      status: DownloadStatus.downloading,
    ));
    if (count == total) {
      ticket.downloadProgressState.accept(DownloadData(
        count,
        total,
        status: DownloadStatus.downloaded,
      ));
    }
    print('count $count : total $total : ${count / total}');
  }

  void _addNewTicket() {
    TicketDomain newTicket = TicketDomain(
      name: nameController.text,
      url: urlController.text,
      created: DateTime.now(),
      downloadProgressState: StateNotifier<DownloadData>(),
    );
    final prevList = _ticketsList.value?.data ?? [];
    prevList.add(newTicket);
    model.addTicket(newTicket);
    _ticketsList.accept(EntityState(data: prevList));
    Navigator.of(context).pop();
  }

  /// Прослушиватель скрола списка билетов
  void _ticketsListScrollListener() {
    /// Когда пользователь долистал до конца, передать состояние
    if (ticketsListScrollController.position.extentAfter <= 20) {
      isEndScrollState.accept(true);
    } else {
      isEndScrollState.accept(false);
    }
  }

  @override
  void deleteTicket(TicketDomain ticket) {
    model.deleteTicket(ticket);
  }
}
