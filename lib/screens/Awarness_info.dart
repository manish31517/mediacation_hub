import 'package:flutter_covid_dashboard_ui/widgets/chewie_list_item.dart';
import 'package:video_player/video_player.dart';
import 'drawer_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_covid_dashboard_ui/widgets/widgets.dart';

class AwarnessInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: DrawerImp(),
      body: ListView(
        children: <Widget>[
          ChewieListItem(
            videoPlayerController:
                VideoPlayerController.asset("assets/videos/video1.mp4"),
            looping: true,
          ),
          ChewieListItem(
            videoPlayerController:
                VideoPlayerController.asset("assets/videos/video2.mp4"),
            looping: true,
          ),
          ChewieListItem(
            videoPlayerController:
                VideoPlayerController.asset("assets/videos/video3.mp4"),
            looping: true,
          )
        ],
      ),
    );
  }

}
