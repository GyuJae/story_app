import 'package:flutter/material.dart';

enum EnumMood implements Comparable<EnumMood> {
  veryBad(value: 1, name: '매우 나쁨', color: Color(0xFFD32F2F), emoji: '😭'),
  bad(value: 2, name: '슬픔', color: Color(0xFF9E9E9E), emoji: '😢'),
  normal(value: 3, name: '보통', color: Color(0xFF8BC34A), emoji: '😐'),
  good(value: 4, name: '좋음', color: Color(0xFF64B5F6), emoji: '😊'),
  veryGood(value: 5, name: '행복', color: Color(0xFFFFF176), emoji: '😍');

  const EnumMood({
    required this.value,
    required this.name,
    required this.color,
    required this.emoji,
  });

  final int value;
  final String name;
  final Color color;
  final String emoji;

  @override
  int compareTo(EnumMood other) => value.compareTo(other.value);

  static EnumMood of(int value) {
    switch (value) {
      case 1:
        return EnumMood.veryBad;
      case 2:
        return EnumMood.bad;
      case 3:
        return EnumMood.normal;
      case 4:
        return EnumMood.good;
      case 5:
        return EnumMood.veryGood;
      default:
        throw ArgumentError('적절하지 않은 값입니다.');
    }
  }

  static int getMaxValue() {
    return EnumMood.veryGood.value;
  }

  static int getMinValue() {
    return EnumMood.veryBad.value;
  }

  static int getMiddleValue() {
    return EnumMood.normal.value;
  }

  static int getLength() {
    return EnumMood.values.length;
  }
}
