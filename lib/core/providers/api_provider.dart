import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/core/api/dummy_api.dart';

/// creates a provider for [WidgetbookApi]
///
/// provides a simulated backend experience
final apiProvider = Provider((_) => WidgetbookApi());

/// creates a provider for [DummyWidgetbookApi]
///
/// provides a simulated backend experience which can be altered per needs
final dummyApiProvider = Provider((_) => DummyWidgetbookApi());
