import 'package:flutter/material.dart';
import 'package:flutter_application/models/movies.dart';
import 'package:flutter_application/models/movies_video.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/componenets/red_border_widget.dart';
import 'package:flutter_application/res/style/text_style.dart';
import 'package:flutter_application/view/detail/detail_screen.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MovieVideoTrailer extends StatefulWidget {
  final Video video;
  final Results movie;
  const MovieVideoTrailer(
      {Key? key,
      required this.video,
      required this.movie})
      : super(key: key);

  @override
  State<MovieVideoTrailer> createState() =>
      _MovieVideoTrailerState();
}

class _MovieVideoTrailerState
    extends State<MovieVideoTrailer> {
  late YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    setState(() {
      _controller = YoutubePlayerController(
        initialVideoId: widget.video.key!,
        params: YoutubePlayerParams(
          startAt: Duration(seconds: 30),
          showControls: true,
          showFullscreenButton: true,
        ),
      );
    });
    final height =
        MediaQuery.of(context).size.height;
    final width =
        MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start,
            children: [
              widget.video.key == null
                  ? Text("Video bulunamadı.")
                  : Container(
                      height: height * .20,
                      width: width * .50,
                      child:
                          YoutubePlayerControllerProvider(
                        // Provides controller to all the widget below it.
                        controller: _controller,
                        child:
                            YoutubePlayerIFrame(
                          aspectRatio: 16 / 9,
                        ),
                      ),
                    ),
              SizedBox(width: width * .05),
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * .35,
                    child: Text(
                      widget.video.name!,
                      style: AppStyle
                          .instance.bodyMedium,
                    ),
                  ),
                  SizedBox(height: height * .02),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.start,
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      RedBorderWidget(
                          text: widget
                              .video.iso31661!),
                      RedBorderWidget(
                          text: widget
                              .video.iso6391!)
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: height * .02,
          ),
          Divider(
            color: AppColors.whiteColor
                .withOpacity(0.5),
          )
        ],
      ),
    );
  }
}
