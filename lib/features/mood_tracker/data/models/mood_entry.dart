import 'package:flutter/material.dart';
import 'package:story_app/core/constants/mood.dart';
import 'package:story_app/features/mood_tracker/domain/entities/mood_entry.dart';

class MoodEntryModel extends MoodEntryEntity {
  const MoodEntryModel({
    required super.id,
    required super.status,
    required super.year,
    required super.month,
    required super.day,
  });

  factory MoodEntryModel.fromJson(Map<String, dynamic> json) {
    return MoodEntryModel(
      id: json['id'],
      status: json['status'],
      year: json['year'],
      month: json['month'],
      day: json['day'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'status': super.status,
      'year': super.year,
      'month': super.month,
      'day': super.day,
    };
  }

  Color getStatusColor() {
    return EnumMood.of(super.status).color;
  }
}
