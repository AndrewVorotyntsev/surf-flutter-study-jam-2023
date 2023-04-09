import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/di/di_container.dart';
import 'package:surf_flutter_study_jam_2023/error_handler/error_handler.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage_screen/ticket_storage_model.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage_screen/ticket_storage_screen.dart';

/// Абстракция Widget Model
abstract class ITicketStorageWidgetModel extends IWidgetModel {}

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
}
