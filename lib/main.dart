import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/app.dart';
import 'package:widgetbook_challenge/core/locales.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: L10n.locales,
      path: L10n.assetLocalePath,
      fallbackLocale: L10n.locales.first,
      child: const ProviderScope(
        child: App(),
      ),
    ),
  );
}
