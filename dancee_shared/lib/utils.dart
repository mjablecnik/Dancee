import 'package:date_time/date_time.dart';

String _formatTime(DateTime dt) => "${dt.hour.toString()}:${dt.minute.toString().padLeft(2, '0')}";

extension DateTimeExtension on DateTime {
  String formatTimeString() => _formatTime(this);

  String formatCzechDate() {
    const List<String> czechMonths = [
      '',
      'ledna',
      'února',
      'března',
      'dubna',
      'května',
      'června',
      'července',
      'srpna',
      'září',
      'října',
      'listopadu',
      'prosince',
    ];

    return "$day. ${czechMonths[month]} $year";
  }
}

extension DateTimeRangeExtension on DateTimeRange {
  String formatString() => "${_formatTime(start)} - ${_formatTime(end)}";

  String formatCzechRange() => "Od ${_formatTime(start)} do ${_formatTime(end)}";
}
