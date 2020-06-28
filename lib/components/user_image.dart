import 'package:flutter/material.dart';

import 'package:vaz_cursos/components/cached_image.dart';
import 'package:vaz_cursos/components/sized_circle.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    Key key,
    @required this.profileImage,
    this.size = 150,
  }) : super(key: key);

  final String profileImage;
  final double size;

  @override
  Widget build(BuildContext context) {
    return profileImage != null
        ? CachedImage(
            imageUrl: profileImage,
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(size),
              child: Image(
                image: imageProvider,
                height: size,
                width: size,
                fit: BoxFit.cover,
              ),
            ),
          )
        : SizedCircle(
            child: Icon(Icons.person, color: Colors.white, size: size - 16),
            elevation: 5.0,
          );
  }
}
