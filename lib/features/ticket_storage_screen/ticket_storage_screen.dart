import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage_screen/ticket_storage_wm.dart';

/// Экран “Хранения билетов”.
class TicketStorageScreen extends ElementaryWidget<ITicketStorageWidgetModel> {
  const TicketStorageScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ITicketStorageWidgetModel wm) {
    return const FlutterLogo();
  }
}

/// Навигация к странице [TicketStorageScreen]
class TicketStorageScreenRoute extends MaterialPageRoute {
  TicketStorageScreenRoute()
      : super(
          builder: (context) => const TicketStorageScreen(),
        );
}
