import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedMonth {
  final int month;
  final int year;

  SelectedMonth({required this.month, required this.year});

  factory SelectedMonth.ofNow() {
    final now = DateTime.now();
    return SelectedMonth(month: now.month, year: now.year);
  }

  int startOfWeek() {
    final firstDayOfMonth = DateTime(year, month, 1);
    return firstDayOfMonth.weekday;
  }

  int endOfPrevMonth() {
    final lastDayOfPrevMonth = DateTime(year, month, 0);
    return lastDayOfPrevMonth.day;
  }

  int startOfMonth() {
    final firstDayOfMonth = DateTime(year, month, 1);
    return firstDayOfMonth.day;
  }

  int endOfMonth() {
    final lastDayOfMonth = DateTime(year, month + 1, 0);
    return lastDayOfMonth.day;
  }

  String displayFormatted() {
    return '$month월 $year년 ';
  }
}

class SelectedMonthModel extends StateNotifier<SelectedMonth> {
  SelectedMonthModel() : super(SelectedMonth.ofNow());

  void selectMonth(int month, int year) {
    state = SelectedMonth(month: month, year: year);
  }
}

final selectedMonthProvider =
    StateNotifierProvider<SelectedMonthModel, SelectedMonth>((ref) {
  return SelectedMonthModel();
});
