import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/res/colors.dart';
import 'package:surf_flutter_study_jam_2023/utils/download_helper.dart';

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

  final StateNotifier<DownloadData> downloadState;

  const TicketCardWidget({
    super.key,
    required this.name,
    required this.progress,
    required this.status,
    this.currentLoaded,
    this.total,
    required this.onDownloadTap,
    required this.downloadState,
  });

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<DownloadData?>(
        listenableState: downloadState,
        builder: (
          BuildContext context,
          DownloadData? downloadData,
        ) {
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
                          value: downloadData?.progress ?? 0,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      if (downloadData?.status == DownloadStatus.waiting ||
                          downloadData?.status == null)
                        Text('Ожидает начала загрузки'),
                      if (downloadData?.status == DownloadStatus.downloading)
                        Text(
                          '${downloadData?.count.MBFromB()?.toStringAsFixed(2)} MБ из ${downloadData?.total.MBFromB()?.toStringAsFixed(2)} MБ',
                        ),
                      if (downloadData?.status == DownloadStatus.downloaded)
                        Text('Загружено'),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                if (downloadData?.status == DownloadStatus.waiting ||
                    downloadData?.status == null)
                  IconButton(
                    icon: Icon(Icons.download),
                    onPressed: onDownloadTap,
                  ),
                if (downloadData?.status == DownloadStatus.downloading)
                  IconButton(
                    icon: Icon(Icons.pause),
                    onPressed: onDownloadTap,
                  ),
                if (downloadData?.status == DownloadStatus.downloaded)
                  IconButton(
                    icon: Icon(Icons.file_copy_outlined),
                    onPressed: onDownloadTap,
                  ),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          );
        });
  }
}
