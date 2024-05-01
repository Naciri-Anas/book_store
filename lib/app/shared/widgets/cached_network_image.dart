import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SplitNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const SplitNetworkImage({
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()), // Use a CircularProgressIndicator as a placeholder
      errorWidget: (context, url, error) => _ErrorWidget(imageUrl: imageUrl,),
      // Remove the progressIndicatorBuilder
    );
  }

  // widget as func
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    super.key, required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}
