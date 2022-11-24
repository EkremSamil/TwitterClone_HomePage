import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitterclone/home/search_view.dart';
import "package:http/http.dart";

import 'home_view.dart';

class TwitterTabbarView extends StatefulWidget {
  const TwitterTabbarView({super.key});

  @override
  State<TwitterTabbarView> createState() => _TwitterTabbarViewState();
}

class _TwitterTabbarViewState extends State<TwitterTabbarView> {
  bool isHeaderClose = false;
  late ScrollController scrollController;
  double lastOffSet = 0;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      print("${scrollController.offset}");
      if (scrollController.offset <= 0) {
        isHeaderClose = false;
      } else if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        isHeaderClose = true;
      } else {
        isHeaderClose = scrollController.offset > lastOffSet ? true : false;
      }
      setState(() {
        lastOffSet = scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _bottomAppBar,
        body: Column(
          children: [
            _containerAppBar,
            Expanded(
              child: TabBarView(
                children: [
                  HomeView(scrollController),
                  SearchView(),
                  Text("asdf"),
                  Text("asdf"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget get _bottomAppBar => BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: _tabBarItems,
    );

Widget get _appBar => AppBar(
      elevation: 0,
      centerTitle: false,
      title: _appBarItems,
    );

Widget get _containerAppBar => AnimatedContainer(
      duration: Duration(milliseconds: 500),
      child: _appBar,
    );

Widget get _appBarItems => Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      children: <Widget>[
        CircleAvatar(
            backgroundImage: AssetImage(
          "image/ekremsamilbolat.png",
        )),
        Text("Home", style: titleTextStyle)
      ],
    );

final titleTextStyle = TextStyle(
  letterSpacing: 1,
  fontSize: 18,
  fontWeight: FontWeight.w800,
  color: Colors.black,
);

Widget get _tabBarItems => TabBar(
      tabs: [
        Tab(icon: Icon(Icons.home)),
        Tab(icon: Icon(Icons.search)),
        Tab(icon: Icon(Icons.notifications)),
        Tab(icon: Icon(CupertinoIcons.text_bubble_fill)),
      ],
    );

Widget get _fabButton => FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    );
