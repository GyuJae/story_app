enum EnumWeek implements Comparable<EnumWeek> {
  monday(weekIndex: 1, name: '월요일'),
  tuesday(weekIndex: 2, name: '화요일'),
  wednesday(weekIndex: 3, name: '수요일'),
  thursday(weekIndex: 4, name: '목요일'),
  friday(weekIndex: 5, name: '금요일'),
  saturday(weekIndex: 6, name: '토요일'),
  sunday(weekIndex: 7, name: '일요일');

  const EnumWeek({
    required this.weekIndex,
    required this.name,
  });

  final int weekIndex;
  final String name;

  String getShortName() {
    return name.replaceAll("요일", "");
  }

  @override
  int compareTo(EnumWeek other) => weekIndex.compareTo(other.weekIndex);
}
