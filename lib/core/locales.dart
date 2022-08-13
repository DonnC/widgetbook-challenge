import 'dart:ui';

/// a class containing each supported [Locale]
class L10n {
  /// app asset locale paths
  static const String assetLocalePath = 'assets/l10n';

  /// all app supported locales
  static final locales = [
    const Locale('en'),
    const Locale('de'),
  ];
}
