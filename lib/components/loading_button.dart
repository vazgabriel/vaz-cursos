import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key key,
    this.color,
    this.textColor,
    this.loading = false,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  final Color color;
  final Color textColor;
  final bool loading;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    void _onPressed() {
      if (!loading) {
        onPressed();
      }
    }

    return Center(
      child: Padding(
        child: MaterialButton(
          color: color,
          textColor: textColor,
          onPressed: _onPressed,
          child: loading
              ? const CircularProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                )
              : Text(
                  text,
                  style: const TextStyle(fontSize: 16.0),
                ),
          height: 48,
          minWidth: loading ? 0 : double.infinity,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(48.0)),
          padding: const EdgeInsets.all(8.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
      ),
    );
  }
}
