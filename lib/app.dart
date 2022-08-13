import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/core/providers/theme_mode_provider.dart';
import 'package:widgetbook_challenge/core/theme.dart';
import 'package:widgetbook_challenge/features/home/views/pages/home_view.dart';

/// The app.
class App extends StatelessWidget {
  /// Creates a new instance of [App].
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final currentThemeMode = ref.watch(themeModeProvider);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Challenge App',
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: currentThemeMode,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: const HomeView(),
        );
      },
    );
  }
}
