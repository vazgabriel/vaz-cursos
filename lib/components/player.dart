import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Player extends StatelessWidget {
  const Player({Key key, this.youtubeId}) : super(key: key);

  final String youtubeId;

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: youtubeId,
    );

    return Center(
      child: YoutubePlayer(
        controller: _controller,
      ),
    );
  }
}
