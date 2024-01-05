import 'package:flutter/material.dart';
import 'package:moviesdb_task/core/models/movie_details_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class WatchTrailerScreen extends StatefulWidget {

  static const String routeName = "/watchTrailerScreen";
  const WatchTrailerScreen({super.key, required this.movieDetailModel});
  final MovieDetailsList movieDetailModel;

  @override
  _WatchTrailerScreenState createState() => _WatchTrailerScreenState();
}

class _WatchTrailerScreenState extends State<WatchTrailerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.movieDetailModel.key,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: Text('YouTube Player Example'),
      // ),
      body: Center(
        child: SizedBox(
          
          child: YoutubePlayer(
            width: double.infinity,
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {
              // Add any custom logic when the video is ready to play
            },
            onEnded: (metaData) => Navigator.pop(context),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

