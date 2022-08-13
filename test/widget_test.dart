import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgetbook_challenge/app.dart';
import 'package:widgetbook_challenge/core/locales.dart';
import 'package:widgetbook_challenge/l10n/locale_keys.g.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    GoogleFonts.config.allowRuntimeFetching = false;

    await EasyLocalization.ensureInitialized();
  });

  testWidgets('Find AppBar and should render localized AppBar title', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: L10n.locales,
        path: L10n.assetLocalePath,
        saveLocale: false,
        fallbackLocale: L10n.locales.first,
        child: const ProviderScope(
          child: App(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(AppBar), findsOneWidget);

    expect(find.text(LocaleKeys.appTitle.tr()), findsOneWidget);
  });
}
