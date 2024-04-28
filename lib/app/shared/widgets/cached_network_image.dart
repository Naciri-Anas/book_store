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
          CircularProgressIndicator(), // Use a CircularProgressIndicator as a placeholder
      errorWidget: (context, url, error) => _buildErrorWidget(),
      // Remove the progressIndicatorBuilder
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}
