import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:story_app/core/constants/sizes.dart';
import 'package:story_app/core/constants/week.dart';
import 'package:story_app/features/mood_tracker/data/models/mood_entry.dart';
import 'package:story_app/features/mood_tracker/presentation/providers/selected_month.dart';
import 'package:story_app/features/mood_tracker/presentation/widgets/mood_tracker_calendar_item.dart';

class MoodTrackerCalendar extends ConsumerWidget {
  static const int _daysInWeek = 7;

  const MoodTrackerCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(selectedMonthProvider);

    return Column(
      children: [
        _buildHeader(selectedMonth, ref),
        const Gap(Sizes.size16),
        Expanded(
          child: _buildCalendar(context, selectedMonth),
        )
      ],
    );
  }

  GridView _buildCalendar(BuildContext context, SelectedMonth selectedMonth) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _daysInWeek,
        crossAxisSpacing: Sizes.size4,
        mainAxisSpacing: Sizes.size6,
      ),
      itemCount: _daysInWeek +
          selectedMonth.startOfWeek() +
          selectedMonth.endOfMonth(),
      itemBuilder: (context, index) {
        if (index < _daysInWeek) {
          return _buildWeek(context, EnumWeek.values[index]);
        } else if (index < _daysInWeek + selectedMonth.startOfWeek()) {
          return _buildPrevMonthDays(
              context, selectedMonth)[index - _daysInWeek];
        } else {
          return _buildCurrentMonthDays(context, selectedMonth)[
              index - _daysInWeek - selectedMonth.startOfWeek()];
        }
      },
    );
  }

  List<Widget> _buildCurrentMonthDays(
      BuildContext context, SelectedMonth selectedMonth) {
    return List.generate(
      selectedMonth.endOfMonth(),
      (index) {
        final day = index + 1;
        final random = Random().nextInt(5) + 1;
        return MoodTrackerCalendarItem(
          day: day,
          // TODO change fetch data
          moodEntryModel: MoodEntryModel.fromJson(
            {
              'id': "1",
              'status': random,
              'date': '2022-01-01',
              'note': "오늘은 그냥 기분이 더럽다.",
              "yearMonth": "2024-07",
            },
          ),
        );
      },
    );
  }

  List<Widget> _buildPrevMonthDays(
      BuildContext context, SelectedMonth selectedMonth) {
    return List.generate(
      selectedMonth.startOfWeek(),
      (index) {
        final day = selectedMonth.endOfPrevMonth() -
            selectedMonth.startOfWeek() +
            index +
            1;
        return Center(
          child: Text(
            '$day',
            style: TextStyle(
              fontSize: Sizes.size14,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        );
      },
    );
  }

  Widget _buildWeek(BuildContext context, EnumWeek week) {
    return Center(
      child: Text(
        week.getShortName(),
        style: TextStyle(
          fontSize: Sizes.size16,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  Row _buildHeader(SelectedMonth selectedMonth, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          selectedMonth.displayFormatted(),
          style: const TextStyle(
            fontSize: Sizes.size18,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                ref.read(selectedMonthProvider.notifier).prevMonth();
              },
              child: Container(
                width: Sizes.size24,
                height: Sizes.size24,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    size: Sizes.size18,
                  ),
                ),
              ),
            ),
            const Gap(Sizes.size12),
            GestureDetector(
              onTap: () {
                ref.read(selectedMonthProvider.notifier).nextMonth();
              },
              child: Container(
                width: Sizes.size24,
                height: Sizes.size24,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.chevronRight,
                    size: Sizes.size18,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
