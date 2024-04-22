// Dart imports:
import 'dart:math';
import 'dart:ui';

// Project imports:
// Package imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<T?> onOpenDialog<T>(
  Widget child, {
  bool isDismissible = true,
  Duration? closeAfter,
  Duration? delay,
}) async {
  if (closeAfter != null) {
    onCloseOverlays(closeDialog: true, closeAfter: closeAfter);
  }
  if (delay != null) await Future.delayed(delay);
  return Get.dialog<T>(
    Padding(
      padding: const EdgeInsets.only(top: 24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
        child: WillPopScope(
          onWillPop: () => Future.value(isDismissible),
          child: child,
        ),
      ),
    ),
    transitionCurve: Curves.easeInOut,
    barrierColor: Colors.black12,
  );
}

Future onCloseOverlays({
  Duration? closeAfter,
  bool closeDialog = false,
  bool closeModal = false,
  bool closeSnackbar = false,
  bool closeOverlays = false,
  bool closeOnce = true,
  dynamic closeOnceResult,
}) async {
  final closeGeneralDialog = closeModal && !(Get.context!.width <= 600);
  if (closeAfter != null) await Future.delayed(closeAfter);
  //TODO: This code brings compatibility of the new snackbar with GetX 4,
  if (closeOverlays && Get.isOverlaysOpen) {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();

    navigator?.popUntil((route) {
      return (!Get.isDialogOpen! && !Get.isBottomSheetOpen!);
    });
  } else {
    if (Get.isSnackbarOpen && closeSnackbar) Get.closeAllSnackbars();
    if ((Get.isBottomSheetOpen ?? false) && closeModal) {
      closeOnce
          ? navigator?.pop(closeOnceResult)
          : navigator?.popUntil((route) => !Get.isBottomSheetOpen!);
    }
    if ((Get.isDialogOpen ?? false) && (closeDialog || closeGeneralDialog)) {
      closeOnce
          ? navigator?.pop(closeOnceResult)
          : navigator?.popUntil((route) => !Get.isDialogOpen!);
    }
  }

  await Future.delayed(const Duration(milliseconds: 250));
}

Future<T?> onOpenModal<T>(Widget child,
    {bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
    EdgeInsets padding = const EdgeInsets.only(top: 16)}) {
  //final marginH = Get.width > AppSizes.breakPointSmall ? (Get.width - AppSizes.breakPointSmall) / 2 : 0.0;
  //final hasMargin = marginH > 0.0;
  final bgColor = backgroundColor ?? Colors.white;

  final body = ClipRect(
    child: Padding(
      padding: padding,
      child: WillPopScope(
        onWillPop: () => Future.value(isDismissible),
        child: child,
      ),
    ),
  );

  if (Get.context!.width <= 600.0) {
    return Get.bottomSheet<T>(
      body,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: bgColor,
    );
  } else {
    return Get.generalDialog(
      barrierLabel: '',
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation1, animation2) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: double.infinity,
            width: min(context.width, 600),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              color: bgColor,
            ),
            child: body,
          ),
        );
      },
      transitionBuilder: (context, animation1, animation2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(1, 0), end: const Offset(0, 0))
              .animate(animation1),
          child: child,
        );
      },
    );
  }
}
