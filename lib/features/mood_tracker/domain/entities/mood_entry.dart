import 'package:equatable/equatable.dart';

class MoodEntryEntity extends Equatable {
  final String id;
  final int status;
  final int year;
  final int month;
  final int day;

  const MoodEntryEntity({
    required this.id,
    required this.status,
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  List<Object?> get props => [id, status, year, month, day];
}
