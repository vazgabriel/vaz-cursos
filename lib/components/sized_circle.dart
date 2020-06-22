import 'package:flutter/material.dart';

class SizedCircle extends StatelessWidget {
  const SizedCircle({
    Key key,
    @required this.child,
    this.padding = const EdgeInsets.all(8.0),
    this.elevation = 0,
  }) : super(key: key);

  final Widget child;
  final double elevation;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: padding,
        child: child,
      ),
      shape: CircleBorder(),
      elevation: elevation,
    );
  }
}
