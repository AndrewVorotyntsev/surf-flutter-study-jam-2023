import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/di/di_container.dart';
import 'package:surf_flutter_study_jam_2023/domain/ticket.dart';
import 'package:surf_flutter_study_jam_2023/error_handler/error_handler.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage_screen/ticket_storage_model.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage_screen/ticket_storage_screen.dart';
import 'package:surf_flutter_study_jam_2023/uikit/popup/show_popup.dart';
import 'package:surf_flutter_study_jam_2023/uikit/ticket_dialog.dart';

/// Абстракция Widget Model
abstract class ITicketStorageWidgetModel extends IWidgetModel {
  /// Состояние списка билетов
  ListenableState<EntityState<List<TicketDomain>>> get ticketsListState;

  void showAddNewTicketDialog();
}

TicketStorageWidgetModel defaultAppWidgetModelFactory(BuildContext context) {
  return TicketStorageWidgetModel(
    TicketStorageScreenModel(
      getIt.get<AppErrorHandler>(),
    ),
  );
}

/// Имплементация и реализация Виджет модели [IHomeUserProfileWidgetModel]
class TicketStorageWidgetModel
    extends WidgetModel<TicketStorageScreen, TicketStorageScreenModel>
    implements ITicketStorageWidgetModel {
  TicketStorageWidgetModel(TicketStorageScreenModel model) : super(model);

  @override
  // TODO: implement newsListState
  ListenableState<EntityState<List<TicketDomain>>> get ticketsListState =>
      _ticketsList;

  final _ticketsList = EntityStateNotifier<List<TicketDomain>>();

  @override
  void initWidgetModel() {
    // TODO: загрузить локальные билеты
    super.initWidgetModel();
  }

  @override
  void showAddNewTicketDialog() {
    showPopUp(
      context,
      NewTicketDialog(
        urlController: TextEditingController(),
        onAddTapped: _addNewTicket,
      ),
    );
  }

  _addNewTicket() {
    final prevList = _ticketsList.value?.data ?? [];
    prevList
        .add(TicketDomain(name: 'ticket', url: '', created: DateTime.now()));
    _ticketsList.accept(EntityState(data: prevList));
  }
}
