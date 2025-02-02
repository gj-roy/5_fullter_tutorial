import 'package:flutter/material.dart';

import 'player_video_and_pop_page.dart';
import 'tab/bumble_bee_remote_video.dart';
import 'tab/butter_fly_asset_video.dart';
import 'tab/butter_fly_asset_video_in_list.dart';

/**
 * Created by Loitp on 08,August,2022
 * Galaxy One company,
 * Vietnam
 * +840766040293
 * freuss47@gmail.com
 */
class VideoPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: const ValueKey<String>('home_page'),
        appBar: AppBar(
          title: const Text('VideoPlayerScreen'),
          actions: <Widget>[
            IconButton(
              key: const ValueKey<String>('push_tab'),
              icon: const Icon(Icons.navigation),
              onPressed: () {
                Navigator.push<PlayerVideoAndPopPage>(
                  context,
                  MaterialPageRoute<PlayerVideoAndPopPage>(
                    builder: (BuildContext context) => PlayerVideoAndPopPage(),
                  ),
                );
              },
            )
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud),
                text: "Remote",
              ),
              Tab(icon: Icon(Icons.insert_drive_file), text: "Asset"),
              Tab(icon: Icon(Icons.list), text: "List roy93group"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            BumbleBeeRemoteVideo(),
            ButterFlyAssetVideo(),
            ButterFlyAssetVideoInList(),
          ],
        ),
      ),
    );
  }
}
