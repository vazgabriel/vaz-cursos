import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({Key key, this.imageUrl, this.circle = false})
      : super(key: key);

  final String imageUrl;
  final bool circle;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: circle
          ? (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
              )
          : null,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fadeInCurve: Curves.easeIn,
      fadeInDuration: Duration(seconds: 1),
    );
  }
}
