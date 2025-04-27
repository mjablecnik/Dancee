import 'package:date_time/date_time.dart';

String _formatTime(DateTime dt) => "${dt.hour.toString()}:${dt.minute.toString().padLeft(2, '0')}";

extension DateTimeExtension on DateTime {
  String formatTimeString() => _formatTime(toLocal());

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

  String formatWithOffset() {
    final offset = timeZoneOffset;
    final hours = offset.inHours.abs().toString().padLeft(2, '0');
    final minutes = (offset.inMinutes.abs() % 60).toString().padLeft(2, '0');
    final sign = offset.isNegative ? '-' : '+';

    return "${toIso8601String()}$sign$hours:$minutes";
  }
}

extension DateTimeRangeExtension on DateTimeRange {
  String formatString() => "${_formatTime(start.toLocal())} - ${_formatTime(end.toLocal())}";

  String formatCzechRange() => "Od ${_formatTime(start.toLocal())} do ${_formatTime(end.toLocal())}";
}

extension DateTimeRangeSerialization on DateTimeRange {
  static Map<String, String> toJsonDateTimeRange(DateTimeRange date) {
    return {"start": date.start.toUtc().toIso8601String(), "end": date.end.toUtc().toIso8601String()};
  }

  static DateTimeRange fromJsonDateTimeRange(Map<String, dynamic> json) {
    return DateTimeRange(start: DateTime.parse(json["start"]!), end: DateTime.parse(json["end"]!));
  }
}
