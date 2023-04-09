import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/res/colors.dart';

class TicketCardWidget extends StatelessWidget {
  /// Название билета
  final String name;

  /// Прогресс скачивания файла
  final double progress;

  /// Статус скачивания файла
  final String status;

  /// Скачанный объем
  final double? currentLoaded;

  /// Общий размер файла
  final double? total;

  final VoidCallback onDownloadTap;

  const TicketCardWidget({
    super.key,
    required this.name,
    required this.progress,
    required this.status,
    this.currentLoaded,
    this.total,
    required this.onDownloadTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: cardShadowColor.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 16,
          ),
          Icon(Icons.airplane_ticket),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  textScaleFactor: 1.4,
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    minHeight: 5,
                    value: progress,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(status)
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          IconButton(
            icon: Icon(Icons.download),
            onPressed: onDownloadTap,
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
