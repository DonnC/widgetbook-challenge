// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/features/home/repositories/app_repository.dart';

import '../../../mocks/mocks.dart';

void main() {
  late String username;
  late Exception apiException;

  setUp(() {
    username = 'John';
    apiException = UnexpectedException();
  });

  test(
      'Given a `name`, When getMessage is called and no error occurs, Then welcomeToWidgetbook is called with `name` which returns Future<String> instance',
      () {
    final mockWidgetbookApi = MockWidgetbookApiSuccess();

    final appRepository = AppRepository(mockWidgetbookApi);

    when(() => mockWidgetbookApi.welcomeToWidgetbook(message: username))
        .thenAnswer((_) async => 'Hello $username');

    final result = appRepository.getMessage(username);

    expect(result, isInstanceOf<Future<String>>());
  });

  test(
      "getMessage() should throw an UnexpectedException when WidgetbookApi's welcomeToWidgetbook throws any Exception",
      () {
    final mockWidgetbookApi = MockWidgetbookApiFailure();

    final appRepository = AppRepository(mockWidgetbookApi);

    when(() => mockWidgetbookApi.welcomeToWidgetbook(message: username))
        .thenThrow(apiException);

    expect(
      () async => appRepository.getMessage(username),
      throwsA(same(apiException)),
    );
  });
}
