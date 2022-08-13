import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validators/validators.dart';
import 'package:widgetbook_challenge/core/locales.dart';
import 'package:widgetbook_challenge/core/providers/theme_mode_provider.dart';
import 'package:widgetbook_challenge/features/home/providers/message_controller_provider.dart';
import 'package:widgetbook_challenge/features/home/views/widgets/custom_textfield.dart';
import 'package:widgetbook_challenge/features/home/views/widgets/result_widget.dart';
import 'package:widgetbook_challenge/features/home/views/widgets/submit_button.dart';
import 'package:widgetbook_challenge/l10n/locale_keys.g.dart';

/// main home page view
class HomeView extends ConsumerStatefulWidget {
  /// Creates a new instance of [HomeView].
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late final TextEditingController nameController;

  bool isValidName = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();

    nameController.addListener(() {
      setState(() {
        isValidName = isAlpha(nameController.text);
      });
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(messageButtonControllerProvider);
    final currentThemeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.appTitle.tr()),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.translate),
            itemBuilder: (context) => L10n.locales
                .map(
                  (e) => PopupMenuItem(
                    value: e,
                    child: Text(e.languageCode),
                    onTap: () {
                      context.setLocale(e);
                    },
                  ),
                )
                .toList(),
          ),
          IconButton(
            onPressed: () {
              if (currentThemeMode == ThemeMode.dark) {
                ref.watch(themeModeProvider.notifier).state = ThemeMode.light;
              } else {
                ref.watch(themeModeProvider.notifier).state = ThemeMode.dark;
              }
            },
            icon: currentThemeMode == ThemeMode.dark
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.greeting.tr(),
              style:
                  Theme.of(context).textTheme.headline1?.copyWith(fontSize: 27),
            ),
            const SizedBox(height: 40),
            Text(
              LocaleKeys.question.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8),
              child: CustomTextField(
                textEditingController: nameController,
                isValidName: isValidName,
              ),
            ),
            const SizedBox(height: 30),
            SubmitButton(
              value: nameController.text,
              isValidValue: isValidName,
            ),
            const SizedBox(height: 30),
            ResultWidget(result: result),
          ],
        ),
      ),
    );
  }
}
