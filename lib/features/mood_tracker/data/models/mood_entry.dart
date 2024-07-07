import 'package:flutter/material.dart';
import 'package:story_app/core/constants/mood.dart';
import 'package:story_app/features/mood_tracker/domain/entities/mood_entry.dart';

class MoodEntryModel extends MoodEntryEntity {
  const MoodEntryModel({
    required super.id,
    required super.status,
    required super.date,
  });

  factory MoodEntryModel.fromJson(Map<String, dynamic> json) {
    return MoodEntryModel(
      id: json['id'],
      status: json['status'],
      date: DateTime.parse(json['date']),
    );
  }

  Color getStatusColor() {
    return EnumMood.of(super.status).color;
  }
}
