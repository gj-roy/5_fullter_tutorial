import 'package:com.roy93group.flutter_tutorial/lib/core/base_stateful_state.dart';
import 'package:com.roy93group.flutter_tutorial/lib/util/ui_utils.dart';
import 'package:com.roy93group.flutter_tutorial/lib/util/url_launcher_utils.dart';
import 'package:com.roy93group.flutter_tutorial/sample/widget/swipe_cards/content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

/**
 * Created by Loitp on 05,August,2022
 * Galaxy One company,
 * Vietnam
 * +840766040293
 * freuss47@gmail.com
 */
class SwipeCardsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwipeCardsScreenState();
  }
}

class _SwipeCardsScreenState extends BaseStatefulState<SwipeCardsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIUtils.getAppBar(
        "swipe_cards",
        () {
          Get.back();
        },
        () {
          UrlLauncherUtils.launchInWebViewWithJavaScript(
              "https://pub.dev/packages/swipe_cards");
        },
      ),
      body: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe Cards Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: true,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    // this.title,
  }) : super(key: key);

  // final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = [
    "Red",
    "Blue",
    "Green",
    "Yellow",
    "Orange",
    "Grey",
    "Purple",
    "Pink"
  ];
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.grey,
    Colors.purple,
    Colors.pink
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i], color: _colors[i]),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Nope ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Superliked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: Text(widget.title!),
      // ),
      body: Container(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: SwipeCards(
              matchEngine: _matchEngine!,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: _swipeItems[index].content.color,
                  child: Text(
                    _swipeItems[index].content.text,
                    style: TextStyle(fontSize: 100),
                  ),
                );
              },
              onStackFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Stack Finished"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              itemChanged: (SwipeItem item, int index) {
                print("item: ${item.content.text}, index: $index");
              },
              leftSwipeAllowed: true,
              rightSwipeAllowed: true,
              upSwipeAllowed: true,
              fillSpace: true,
              likeTag: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.green)),
                child: Text('Like'),
              ),
              nopeTag: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: Text('Nope'),
              ),
              superLikeTag: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.orange)),
                child: Text('Super Like'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _matchEngine!.currentItem?.nope();
                    },
                    child: Text("Nope")),
                ElevatedButton(
                    onPressed: () {
                      _matchEngine!.currentItem?.superLike();
                    },
                    child: Text("Superlike")),
                ElevatedButton(
                    onPressed: () {
                      _matchEngine!.currentItem?.like();
                    },
                    child: Text("Like"))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
