import 'package:flutter/material.dart';

enum ButtonVariant {
  Default,
  Full,
}

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key key,
    this.color,
    this.textColor,
    this.loading = false,
    this.raised = true,
    @required this.child,
    @required this.onPressed,
    this.variant = ButtonVariant.Default,
  }) : super(key: key);

  final Color color;
  final Color textColor;
  final bool loading;
  final bool raised;
  final Widget child;
  final Function onPressed;
  final ButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: const Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: const CircularProgressIndicator(),
        ),
      );
    }

    final button = raised
        ? RaisedButton(
            color: color,
            textColor: textColor,
            onPressed: onPressed,
            child: child)
        : FlatButton(
            color: color,
            textColor: textColor,
            onPressed: onPressed,
            child: child);

    return variant == ButtonVariant.Full
        ? SizedBox(
            width: double.maxFinite,
            child: button,
          )
        : button;
  }
}
