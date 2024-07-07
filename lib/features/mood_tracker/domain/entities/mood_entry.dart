import 'package:equatable/equatable.dart';

class MoodEntryEntity extends Equatable {
  final String id;
  final int status;
  final DateTime date;

  const MoodEntryEntity({
    required this.id,
    required this.status,
    required this.date,
  });

  @override
  List<Object?> get props => [id, status, date];
}
