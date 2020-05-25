import 'package:flutter/material.dart';

class StarScore extends StatelessWidget {
  const StarScore({Key key, this.score}) : super(key: key);

  final double score;

  getStarIcon(int index) {
    if (score >= index) {
      return Icon(Icons.star);
    }
    if (score >= index - 0.5) {
      return Icon(Icons.star_half);
    }
    return Icon(Icons.star_border);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        for (int i = 1; i <= 5; i++)
          getStarIcon(i)
      ],
    );
  }
}
