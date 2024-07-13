import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:story_app/core/constants/mood.dart';
import 'package:story_app/core/constants/sizes.dart';
import 'package:story_app/features/mood_tracker/presentation/providers/tab_state.dart';

class MoodEntityRegisterPage extends ConsumerStatefulWidget {
  const MoodEntityRegisterPage({super.key});

  @override
  MoodEntityRegisterPageState createState() => MoodEntityRegisterPageState();
}

class MoodEntityRegisterPageState
    extends ConsumerState<MoodEntityRegisterPage> {
  EnumMood selectedMood = EnumMood.normal;

  void _onChangeMood(double value) {
    setState(() {
      selectedMood = EnumMood.of(value.toInt());
    });
  }

  void _onSave() {
    // TODO implements
    ref.read(tabStateProvider.notifier).selectTab(EnumTabItem.home);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selectedMood.color,
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
                  selectedMood.emoji,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Gap(Sizes.size16),
            Text(
              selectedMood.name,
              style: const TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              min: EnumMood.getMinValue().toDouble(),
              max: EnumMood.getMaxValue().toDouble(),
              divisions: EnumMood.getLength() - 1,
              value: selectedMood.value.toDouble(),
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
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      Sizes.size3,
                    ),
                  ),
                ),
                child: const Text(
                  "저장",
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
