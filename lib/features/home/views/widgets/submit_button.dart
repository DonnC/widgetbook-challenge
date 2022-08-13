// ignore_for_file: use_key_in_widget_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/features/home/extensions/async_extension.dart';
import 'package:widgetbook_challenge/features/home/providers/message_controller_provider.dart';
import 'package:widgetbook_challenge/features/home/views/widgets/custom_button.dart';
import 'package:widgetbook_challenge/l10n/locale_keys.g.dart';

/// a custom [SubmitButton] to connect to logic controller
class SubmitButton extends ConsumerWidget {
  /// Creates a new instance of [SubmitButton].
  const SubmitButton({
    required this.value,
    this.isValidValue = false,
  });

  /// the value entered by the user,
  /// passed from the [TextField]
  final String value;

  /// whether to allow onTap callback if value is valid or disable interaction
  final bool isValidValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      messageButtonControllerProvider,
      (_, state) =>
          state.isRefreshing ? null : state.showSnackBarOnError(context),
    );

    final messageState = ref.watch(messageButtonControllerProvider);

    return CustomButton(
      text: LocaleKeys.submitButtonText.tr(),
      isLoading: messageState.isLoading,
      onTap: messageState.isLoading || value.isEmpty || !isValidValue
          ? null
          : () => ref
              .read(messageButtonControllerProvider.notifier)
              .getMessage(value),
    );
  }
}
