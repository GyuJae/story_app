import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:story_app/core/constants/mood.dart';
import 'package:story_app/core/constants/sizes.dart';
import 'package:story_app/features/mood_tracker/presentation/providers/register_today_mood.dart';
import 'package:story_app/features/mood_tracker/presentation/providers/tab_state.dart';

class MoodEntityRegisterPage extends ConsumerStatefulWidget {
  const MoodEntityRegisterPage({super.key});

  @override
  MoodEntityRegisterPageState createState() => MoodEntityRegisterPageState();
}

class MoodEntityRegisterPageState
    extends ConsumerState<MoodEntityRegisterPage> {
  EnumMood _selectedMood = EnumMood.normal;
  bool _loading = false;

  void _onChangeMood(double value) {
    setState(() {
      _selectedMood = EnumMood.of(value.toInt());
    });
  }

  void _onSave() async {
    setState(() {
      _loading = true;
    });
    await ref.read(registerTodayMoodProvider).execute(_selectedMood);
    ref.read(tabStateProvider.notifier).selectTab(EnumTabItem.home);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _selectedMood.color,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size24,
        ),
        child: Column(
          children: [
            const Text(
              "오늘 기분은 어떠신가요?",
              style: TextStyle(
                fontSize: Sizes.size20,
                color: Colors.black87,
              ),
            ),
            const Gap(Sizes.size16),
            Expanded(
              child: Center(
                child: Text(
                  _selectedMood.emoji,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Gap(Sizes.size16),
            Text(
              _selectedMood.name,
              style: const TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              min: EnumMood.getMinValue().toDouble(),
              max: EnumMood.getMaxValue().toDouble(),
              divisions: EnumMood.getLength() - 1,
              value: _selectedMood.value.toDouble(),
              activeColor: Theme.of(context).textTheme.bodyLarge!.color,
              onChanged: _onChangeMood,
            ),
            const Gap(Sizes.size16),
            GestureDetector(
              onTap: _onSave,
              child: Container(
                width: MediaQuery.of(context).size.width - Sizes.size48,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                  vertical: Sizes.size12,
                ),
                decoration: BoxDecoration(
                  color: _loading ? Colors.grey.shade400 : Colors.black,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      Sizes.size3,
                    ),
                  ),
                ),
                child: Text(
                  _loading ? "로딩중..." : "저장",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
