import 'package:com.roy93group.flutter_tutorial/lib/core/base_stateful_state.dart';
import 'package:com.roy93group.flutter_tutorial/lib/util/ui_utils.dart';
import 'package:com.roy93group.flutter_tutorial/lib/util/url_launcher_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'images.dart';

/**
 * Created by Loitp on 05,August,2022
 * Galaxy One company,
 * Vietnam
 * +840766040293
 * freuss47@gmail.com
 */
class StickyHeadersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StickyHeadersScreenState();
  }
}

class _StickyHeadersScreenState extends BaseStatefulState<StickyHeadersScreen> {
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
        "sticky_headers",
        () {
          Get.back();
        },
        () {
          UrlLauncherUtils.launchInWebViewWithJavaScript(
              "https://pub.dev/packages/sticky_headers");
        },
      ),
      body: MainScreen(),
    );
  }
}

@immutable
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: <Widget>[
          ListTile(
            title: const Text('Example 1 - Headers and Content'),
            onTap: () => navigateTo(context, (context) => const Example1()),
          ),
          ListTile(
            title: const Text('Example 2 - Animated Headers with Content'),
            onTap: () => navigateTo(context, (context) => const Example2()),
          ),
          ListTile(
            title: const Text('Example 3 - Headers overlapping the Content'),
            onTap: () => navigateTo(context, (context) => const Example3()),
          ),
          ListTile(
            title: const Text('Example 4 - Example using scroll controller'),
            onTap: () => navigateTo(context, (context) => const Example4()),
          ),
        ],
      ).toList(growable: false),
    );
  }

  void navigateTo(BuildContext context, WidgetBuilder builder) {
    Navigator.of(context).push(MaterialPageRoute(builder: builder));
  }
}

@immutable
class Example1 extends StatelessWidget {
  const Example1({
    Key? key,
    this.controller,
  }) : super(key: key);

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      wrap: controller == null,
      title: 'Example 1',
      child: ListView.builder(
        primary: controller == null,
        controller: controller,
        itemBuilder: (context, index) {
          return StickyHeader(
            controller: controller, // Optional
            header: Container(
              height: 50.0,
              color: Colors.blueGrey[700],
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Header #$index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            content: Container(
              color: Colors.grey[300],
              child: Image.network(
                imageForIndex(index),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
              ),
            ),
          );
        },
      ),
    );
  }

  String imageForIndex(int index) {
    return Images.imageThumbUrls[index % Images.imageThumbUrls.length];
  }
}

@immutable
class Example2 extends StatelessWidget {
  const Example2({
    Key? key,
    this.controller,
  }) : super(key: key);

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      wrap: controller == null,
      title: 'Example 2',
      child: ListView.builder(
        primary: controller == null,
        controller: controller,
        itemBuilder: (context, index) {
          return StickyHeaderBuilder(
            controller: controller, // Optional
            builder: (BuildContext context, double stuckAmount) {
              stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
              return Container(
                height: 50.0,
                color:
                    Color.lerp(Colors.blue[700], Colors.red[700], stuckAmount),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Header #$index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Offstage(
                      offstage: stuckAmount <= 0.0,
                      child: Opacity(
                        opacity: stuckAmount,
                        child: IconButton(
                          icon: const Icon(Icons.favorite, color: Colors.white),
                          onPressed: () => ScaffoldMessenger.of(context)
                              .showSnackBar(
                                  SnackBar(content: Text('Favorite #$index'))),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            content: Container(
              color: Colors.grey[300],
              child: Image.network(
                imageForIndex(index),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
              ),
            ),
          );
        },
      ),
    );
  }

  String imageForIndex(int index) {
    return Images.imageThumbUrls[index % Images.imageThumbUrls.length];
  }
}

@immutable
class Example3 extends StatelessWidget {
  const Example3({
    Key? key,
    this.controller,
  }) : super(key: key);

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      wrap: controller == null,
      title: 'Example 3',
      child: ListView.builder(
        primary: controller == null,
        controller: controller,
        itemBuilder: (context, index) {
          return StickyHeaderBuilder(
            overlapHeaders: true,
            controller: controller, // Optional
            builder: (BuildContext context, double stuckAmount) {
              stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
              return Container(
                height: 50.0,
                color:
                    Colors.grey.shade900.withOpacity(0.6 + stuckAmount * 0.4),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Header #$index',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
            content: Container(
              color: Colors.grey[300],
              child: Image.network(
                imageForIndex(index),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
              ),
            ),
          );
        },
      ),
    );
  }

  String imageForIndex(int index) {
    return Images.imageThumbUrls[index % Images.imageThumbUrls.length];
  }
}

@immutable
class ScaffoldWrapper extends StatelessWidget {
  const ScaffoldWrapper({
    Key? key,
    required this.title,
    required this.child,
    this.wrap = true,
  }) : super(key: key);

  final Widget child;
  final String title;
  final bool wrap;

  @override
  Widget build(BuildContext context) {
    if (wrap) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Hero(
            tag: 'app_bar',
            child: AppBar(
              title: Text(title),
              elevation: 0.0,
            ),
          ),
        ),
        body: child,
      );
    } else {
      return Material(
        child: child,
      );
    }
  }
}

@immutable
class Example4 extends StatefulWidget {
  const Example4({Key? key}) : super(key: key);

  @override
  State<Example4> createState() => _Example4State();
}

class _Example4State extends State<Example4> {
  late final _controller = List.generate(4, (_) => ScrollController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: _controller[0],
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text('Example 4'),
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                bottom: const TabBar(
                  tabs: <Tab>[
                    Tab(text: 'Example 1'),
                    Tab(text: 'Example 2'),
                    Tab(text: 'Example 3'),
                  ],
                ),
              ),
            ];
          },
          body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: TabBarView(
              children: <Widget>[
                Example1(controller: _controller[1]),
                Example2(controller: _controller[2]),
                Example3(controller: _controller[3]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
