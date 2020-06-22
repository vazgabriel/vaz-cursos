import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    Key key,
    this.imageUrl,
    this.height,
    this.width,
    this.circle = false,
    this.imageBuilder,
  }) : super(key: key);

  final String imageUrl;
  final bool circle;
  final double height;
  final double width;
  final Widget Function(BuildContext, ImageProvider<dynamic>) imageBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: circle
          ? (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
              )
          : imageBuilder,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fadeInCurve: Curves.easeIn,
      fadeInDuration: const Duration(seconds: 1),
      height: height,
      width: width,
    );
  }
}
