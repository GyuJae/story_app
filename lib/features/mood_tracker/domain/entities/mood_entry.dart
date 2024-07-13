import 'package:equatable/equatable.dart';

class MoodEntryEntity extends Equatable {
  final String id;
  final int status;
  final DateTime date;
  final String note;
  final String yearMonth;

  const MoodEntryEntity({
    required this.id,
    required this.status,
    required this.date,
    required this.note,
    required this.yearMonth,
  });

  @override
  List<Object?> get props => [id, status, date];
}
