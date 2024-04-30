// Package imports:
// Project imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Flutter imports:

// Package imports:
// Project imports:

class AppDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final double circularBorderRadius;
  final bool enableMsgAnimation;
  final Widget? header;
  final Widget? content;

  final double width;
  final double? height;
  final double spaceTitleSubTitle;
  final double spaceBetweenHeaderContent;
  final bool scrollable;

  const AppDialog({
    super.key,
    this.header,
    this.content,
    this.title,
    this.message,
    this.circularBorderRadius = 15.0,
    this.enableMsgAnimation = false,
    this.width = 300.0,
    this.height,
    this.scrollable = true,
    this.spaceTitleSubTitle = 8,
    this.spaceBetweenHeaderContent = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AlertDialog(
        backgroundColor: context.theme.dialogBackgroundColor,
        clipBehavior: Clip.antiAlias,
        scrollable: scrollable,
        contentPadding: const EdgeInsets.all(24.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(circularBorderRadius)),
        content: SizedBox(
            width: width,
            // height: height,
            child: Column(
              children: [
                if (header != null) header!,
                if (header != null) const SizedBox(height: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (title != null)
                      Text(
                        title!,
                        style: context.textTheme.headlineLarge?.copyWith(color: Colors.black),
                        maxLines: 1,
                        textAlign: TextAlign.start,
                      ),
                    if (title != null && message != null) SizedBox(height: spaceTitleSubTitle),
                    if (message != null)
                      Text(
                        message ?? '',
                        style: context.textTheme.bodyLarge!.copyWith(
                          color:Colors.grey,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 6,
                      ),
                  ],
                ),
                if (content != null) SizedBox(height: spaceBetweenHeaderContent),
                if (content != null && scrollable) content!,
                if (content != null && !scrollable) Expanded(child: content!)
              ],
            )),
      ),
    );
  }
}
