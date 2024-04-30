// Dart imports:
import 'dart:async';

import 'package:book_store/core/errors/message_types.dart';
import 'package:book_store/core/loading/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Dart imports:

class AppSnackBar {
  final Rx<LoadingState?>? loadingState;
  final SnackPosition? position;
  final Duration duration;

  AppSnackBar({
    required this.loadingState,
    this.position,
    this.duration = const Duration(seconds: 4),
  });

  StreamSubscription initListener() {
    StreamSubscription loadingSub = loadingState!.listen((value) {
      MessageType? messageType;
      String? message;

      if (value is ERROR) {
        message = value.message;
        messageType = value.type ?? MessageType.danger;
      } else if (value is LOADED) {
        message = value.message;
        messageType = value.type ?? MessageType.success;
      } else {
        return;
      }

      if (message?.isEmpty ?? true) return;

      /// Get color
      final color = _getColorByMessageType(messageType);
      final textColor = _getColorTextByMessageType(messageType);

      /// hide snackbar if already exist
      if (Get.isSnackbarOpen) Get.closeAllSnackbars();
      Get.rawSnackbar(
        messageText: Text(
          message!,
          style: Get.theme.textTheme.titleMedium?.copyWith(
            color: textColor,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: color,
        maxWidth: 600,
        animationDuration: const Duration(milliseconds: 500),
        duration: duration,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
        barBlur: 10,
        snackPosition: position ?? SnackPosition.TOP,
      );
    });
    return loadingSub;
  }

  Color _getColorByMessageType(MessageType? messageType) {
    const double snackBarOpacity = 0.65;
    switch (messageType) {
      case MessageType.info:
        return MessageTypeColors.info.withOpacity(snackBarOpacity);
      case MessageType.danger:
        return MessageTypeColors.danger.withOpacity(snackBarOpacity);
      case MessageType.success:
        return MessageTypeColors.success.withOpacity(snackBarOpacity);
      case MessageType.warning:
        return MessageTypeColors.warning.withOpacity(snackBarOpacity);
      default:
        return MessageTypeColors.primary.withOpacity(snackBarOpacity);
    }
  }

  Color _getColorTextByMessageType(MessageType? messageType) {
    switch (messageType) {
      case MessageType.info:
        return Colors.black;
      default:
        return Colors.white;
    }
  }
}

