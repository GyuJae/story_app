import 'package:equatable/equatable.dart';

class MoodEntryEntity extends Equatable {
  final String id;
  final int status;
  final DateTime date;
  final String note;

  const MoodEntryEntity({
    required this.id,
    required this.status,
    required this.date,
    required this.note,
  });

  @override
  List<Object?> get props => [id, status, date];
}
