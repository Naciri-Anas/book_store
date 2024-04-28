import 'package:book_store/app/shared/widgets/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AreYouSureDialog extends StatelessWidget {
  const AreYouSureDialog({
    Key? key,
    this.title,
    this.message,
    this.primaryTitle,
    this.secondaryTitle,
    this.primaryLoading = false,
    this.onPrimaryTap,
    this.primaryColor,
    this.onSecondaryTap,
    this.assetName,
  }) : super(key: key);

  final String? title;
  final String? message;
  final String? primaryTitle;
  final String? secondaryTitle;
  final bool primaryLoading;
  final Color? primaryColor;
  final VoidCallback? onPrimaryTap;
  final VoidCallback? onSecondaryTap;
  final String? assetName;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: title ?? 'Are You Sure?', 
      message: message,
      header: Container(), 
      content: AppChooseView(
        primaryLoading: primaryLoading,
        onPrimaryTap: onPrimaryTap,
        primaryTitle: primaryTitle,
        primaryColor: primaryColor,
        onSecondaryTap: onSecondaryTap,
        secondaryTitle: secondaryTitle ?? 'Cancel',
      ),
    );
  }
}

class AppChooseView extends StatelessWidget {
  const AppChooseView({
    Key? key,
    required this.primaryLoading,
    this.onPrimaryTap,
    this.primaryTitle,
    this.primaryColor,
    this.onSecondaryTap,
    this.secondaryTitle,
  }) : super(key: key);

  final bool primaryLoading;
  final VoidCallback? onPrimaryTap;
  final String? primaryTitle;
  final Color? primaryColor;
  final VoidCallback? onSecondaryTap;
  final String? secondaryTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () => onPrimaryTap?.call(),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor ?? Colors.red, // Default color
          ),
          child: primaryLoading
              ? CircularProgressIndicator() // Default loading indicator
              : Text(primaryTitle ?? 'Confirm'), // Default primary title
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () => onSecondaryTap == null ? Get.back() : onSecondaryTap!(),
          child: Text(secondaryTitle ?? 'Cancel'), // Default secondary title
        ),
      ],
    );
  }
}
