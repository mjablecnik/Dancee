library;

import 'package:date_time/date_time.dart';

String _formatTime(DateTime dt) => "${dt.hour.toString()}:${dt.minute.toString().padLeft(2, '0')}";

final weekDays = ["Pondělí", "Úterý", "Středa", "Čtvrtek", "Pátek", "Sobota", "Neděle"];

extension DateTimeExtension on DateTime {
  String formatTimeString({bool isLocal = false}) => _formatTime(isLocal ? this : toLocal());

  String formatCzechDate({isShort = false}) {
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

    return isShort ? "$day. $month. $year" : "$day. ${czechMonths[month]} $year";
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
  String formatString({bool isLocal = false}) {
    return "${start.formatTimeString(isLocal: isLocal)} - ${end.hour == start.hour ? "???" : end.formatTimeString(isLocal: isLocal)}";
  }

  String formatCzechRange({bool isLocal = false}) {
    return "Od ${start.formatTimeString(isLocal: isLocal)} do ${end.formatTimeString(isLocal: isLocal)}";
  }
}

extension DateTimeRangeSerialization on DateTimeRange {
  static Map<String, String> toJsonDateTimeRange(DateTimeRange date) {
    return {"start": date.start.toUtc().toIso8601String(), "end": date.end.toUtc().toIso8601String()};
  }

  static DateTimeRange fromJsonDateTimeRange(Map<String, dynamic> json) {
    return DateTimeRange(start: DateTime.parse(json["start"]!), end: DateTime.parse(json["end"]!));
  }
}
