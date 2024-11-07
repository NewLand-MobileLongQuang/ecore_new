class DateTimeNow {
  static DateTime dateTime = DateTime.now();

}

class QrCode {
  final String id;
  final String code;
  final DateTime time;

  QrCode({required this.id, required this.code, required this.time});

  static DateTime toDateTime(String timeString) => DateTime.parse('1970-01-01 $timeString');

  static List<QrCode> listQr = [
    QrCode(id: '1', code: 'QR01', time: toDateTime('08:00:00.000')),
    QrCode(id: '2', code: 'QR02', time: toDateTime('08:00:02.000')),
    QrCode(id: '3', code: 'QR03', time: toDateTime('08:00:04.000')),

    QrCode(id: '7', code: 'QR07', time: QrCode.toDateTime('08:00:12.000')),
    QrCode(id: '8', code: 'QR08', time: QrCode.toDateTime('08:00:14.000')),
    QrCode(id: '9', code: 'QR09', time: QrCode.toDateTime('08:00:16.000')),

    QrCode(id: '13', code: 'QR13', time: QrCode.toDateTime('08:00:22.000')),
    QrCode(id: '14', code: 'QR14', time: QrCode.toDateTime('08:00:24.000')),
    QrCode(id: '15', code: 'QR15', time: QrCode.toDateTime('08:00:26.000')),

    QrCode(id: '19', code: 'QR19', time: QrCode.toDateTime('08:00:36.000')),
    QrCode(id: '20', code: 'QR20', time: QrCode.toDateTime('08:00:38.000')),
    QrCode(id: '21', code: 'QR21', time: QrCode.toDateTime('08:00:40.000')),
    QrCode(id: '22', code: 'QR22', time: QrCode.toDateTime('08:00:42.000')),
    QrCode(id: '23', code: 'QR23', time: QrCode.toDateTime('08:00:44.000')),
  ];
}