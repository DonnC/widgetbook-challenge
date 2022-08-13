import 'dart:math';

import 'package:mocktail/mocktail.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';

/// simulate an exception upon request
/// 
/// throws a [UnexpectedException]
class WidgetbookApiFailure implements WidgetbookApi {
  @override
  Random get randomNumberGenerator => throw UnimplementedError();

  @override
  Future<String> welcomeToWidgetbook({required String message}) {
    throw UnexpectedException();
  }
}

class MockWidgetbookApiSuccess extends Mock implements WidgetbookApi {}

class MockWidgetbookApiFailure extends Mock implements WidgetbookApiFailure {}
