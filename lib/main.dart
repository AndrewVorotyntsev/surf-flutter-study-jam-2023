import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:surf_flutter_study_jam_2023/db/ticket_data.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage_screen/ticket_storage_screen.dart';
import 'package:surf_flutter_study_jam_2023/res/common_strings.dart';

import 'di/di_container.dart';

void main() async {
  /// Инициализируем локальную базу данных
  await Hive.initFlutter();
  Hive.registerAdapter<TicketData>(TicketDataAdapter());
  await Hive.openBox<TicketData>(contactsBoxName);

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tickets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TicketStorageScreen(),
    );
  }
}
