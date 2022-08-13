import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/core/colors.dart';
import 'package:widgetbook_challenge/core/providers/theme_mode_provider.dart';

/// Custom textfield widget
class CustomTextField extends ConsumerWidget {
  /// Creates a new instance of [CustomTextField].
  const CustomTextField({
    Key? key,
    required this.textEditingController,
    this.isValidName = false,
  }) : super(key: key);

  /// [TextField] text editing controller
  final TextEditingController textEditingController;

  /// indicate if [textEditingController] value is valid
  final bool isValidName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.watch(themeModeProvider);

    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: AppColors.kShadeColor),
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: 'My name',
          hintStyle: const TextStyle(fontWeight: FontWeight.bold),
          prefixIcon: const Icon(
            Icons.person,
            color: AppColors.kShadeColor,
          ),
          suffix: isValidName
              ? const Icon(
                  Icons.sentiment_very_satisfied,
                  color: AppColors.kGreenIndicatorColor,
                )
              : const Icon(
                  Icons.sentiment_dissatisfied,
                  color: AppColors.kRedIndicatorColor,
                ),
          filled: true,
          fillColor: AppColors.kShadeColor.withOpacity(0.1),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: currentThemeMode == ThemeMode.light
                  ? AppColors.kShadeColor.withOpacity(0.1)
                  : AppColors.kTextFieldFillColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
