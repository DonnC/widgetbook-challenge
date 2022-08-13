import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// custom async value result widget
class ResultWidget extends StatelessWidget {
  /// create a new instance of [ResultWidget]
  const ResultWidget({Key? key, required this.result}) : super(key: key);

  /// computation result
  final AsyncValue<dynamic> result;

  @override
  Widget build(BuildContext context) {
    if (result.hasValue && result.value != null && !result.hasError) {
      return Center(child: Text(result.value.toString()));
    }

    return const SizedBox.shrink();
  }
}
