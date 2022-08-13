import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/core/providers/api_provider.dart';
import 'package:widgetbook_challenge/features/home/repositories/app_repository.dart';

/// creates a provider for [AppRepository]
///
/// encapsulates backend operations
final repositoryProvider =
    Provider((ref) => AppRepository(ref.read(apiProvider)));
