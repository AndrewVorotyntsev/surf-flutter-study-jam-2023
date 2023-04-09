import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/domain/ticket.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage_screen/ticket_storage_wm.dart';
import 'package:surf_flutter_study_jam_2023/uikit/ticket_card_widget.dart';

/// Экран “Хранения билетов”.
class TicketStorageScreen extends ElementaryWidget<ITicketStorageWidgetModel> {
  const TicketStorageScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ITicketStorageWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Хранение билетов'),
      ),
      body: SafeArea(
        child: EntityStateNotifierBuilder<List<TicketDomain>>(
          listenableEntityState: wm.newsListState,
          builder: (BuildContext context, List<TicketDomain>? newsList) {
            if (newsList == null) {
              return _TicketsListPlaceholder();
            }
            if (newsList.isEmpty) {
              return _TicketsListPlaceholder();
            }
            return SizedBox();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Добавить'),
        onPressed: () => wm.showAddNewTicketDialog(),
      ),
    );
  }
}

/// Навигация к странице [TicketStorageScreen]
class TicketStorageScreenRoute extends MaterialPageRoute {
  TicketStorageScreenRoute()
      : super(
          builder: (context) => const TicketStorageScreen(),
        );
}

class _TicketsListPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Здесь пока ничего нет",
        textScaleFactor: 2,
      ),
    );
  }
}
