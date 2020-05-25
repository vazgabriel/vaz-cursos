import 'package:flutter/material.dart';

class ChipInfo extends StatelessWidget {
  const ChipInfo({Key key, this.title, this.info}) : super(key: key);

  final String title;
  final List<String> info;

  @override
  Widget build(BuildContext context) {
    var chips = info
        .map(
          (e) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Chip(
              label: Text(
                e,
                style: TextStyle(fontSize: 10.0),
              ),
            ),
          ),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('O que voce precisa saber'),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: chips,
        )
      ],
    );
  }
}
