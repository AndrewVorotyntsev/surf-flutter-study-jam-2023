/// Вспомогательный класс для загрузки
class DownloadData {
  int? count;
  int? total;
  double get progress => count != null && total != total ? count! / total! : 0;

  DownloadStatus status;

  DownloadData({
    this.count,
    this.total,
    this.status = DownloadStatus.waiting,
  });
}

enum DownloadStatus { waiting, downloading, downloaded }

/// Перевести МБ в Б
extension MBFromBytes on int? {
  /// Перевести Б в Мб
  double? MBFromB() {
    return ((this ?? 0) / (1048576));
  }
// ···
}
