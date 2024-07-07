enum EnumWeek implements Comparable<EnumWeek> {
  monday(value: 1, name: '월요일'),
  tuesday(value: 2, name: '화요일'),
  wednesday(value: 3, name: '수요일'),
  thursday(value: 4, name: '목요일'),
  friday(value: 5, name: '금요일'),
  saturday(value: 6, name: '토요일'),
  sunday(value: 7, name: '일요일');

  const EnumWeek({
    required this.value,
    required this.name,
  });

  final int value;
  final String name;

  String getShortName() {
    return name.replaceAll("요일", "");
  }

  @override
  int compareTo(EnumWeek other) => value.compareTo(other.value);
}
