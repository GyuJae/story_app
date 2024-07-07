import 'package:flutter/material.dart';

enum EnumMood implements Comparable<EnumMood> {
  veryBad(value: 1, name: '매우 나쁨', color: Color(0xFFFFB3BA)),
  bad(value: 2, name: '슬픔', color: Color(0xFFB2C9E2)),
  normal(value: 3, name: '보통', color: Color(0xFFB3E5CC)),
  good(value: 4, name: '좋음', color: Color(0xFFB2E4F2)),
  veryGood(value: 5, name: '행복', color: Color(0xFFFFFFB3));

  const EnumMood({
    required this.value,
    required this.name,
    required this.color,
  });

  final int value;
  final String name;
  final Color color;

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
}
