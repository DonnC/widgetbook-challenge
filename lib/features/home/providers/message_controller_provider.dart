import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/features/home/controllers/message_button_controller.dart';


/// create a [MessageButtonController] provider
final messageButtonControllerProvider =
    StateNotifierProvider<MessageButtonController, AsyncValue>(
  (ref) => MessageButtonController(ref: ref),
);
