import 'package:flutter/material.dart';

import '../model/trend_topic.dart';

class SearchView extends StatefulWidget {
  @override
  State<SearchView> createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  double _padding = 20;
  late TrendTopic _topic;

  @override
  void initState() {
    super.initState();

    _topic = TrendTopic(
        hashtag: "#Champions League",
        location: "Trending in Turkey",
        tweets: "16.8k Tweets");
  }

  Future tempFuture() async {
    print("asdasd");
    await Future.delayed(Duration(milliseconds: 500));
    print("123123");
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: tempFuture,
      child: ListView(children: [
        _downIconWidget,
        _emptySpace,
        _trendTitleWidget,
        _listHashView,
      ]),
    );
  }

  Widget get _emptySpace => SizedBox(height: 10);

  Widget get _downIconWidget => Container(
        child: Icon(Icons.arrow_downward),
      );

  Widget get _trendTitleWidget => Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        margin: EdgeInsets.all(0),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(color: Colors.grey, width: 0.5)),
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: _padding),
          alignment: Alignment.centerLeft,
          child: Text("Trends for you",
              style: Theme.of(context).textTheme.headline4),
        ),
      );

  Widget get _divider => Divider(
        height: 1,
        color: Colors.grey,
      );

  Widget get _listHashView => ListView.separated(
        itemBuilder: ((context, index) => cardListMethod()),
        separatorBuilder: (context, index) => _divider,
        itemCount: 5,
        shrinkWrap: true,
      );

  Card cardListMethod() {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        side: BorderSide(style: BorderStyle.none),
      ),
      child: listPadding(),
    );
  }

  Padding listPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _padding, vertical: 5),
      child: row(topic: _topic),
    );
  }
}

class row extends StatelessWidget {
  const row({
    Key? key,
    required TrendTopic topic,
  })  : _topic = topic,
        super(key: key);

  final TrendTopic _topic;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Wrap(
            direction: Axis.vertical,
            spacing: 5,
            children: [
              Text(
                _topic.location,
                style: Theme.of(context).textTheme.caption,
              ),
              Text(_topic.hashtag,
                  style: Theme.of(context).textTheme.headline6),
              Text(_topic.tweets, style: Theme.of(context).textTheme.button)
            ],
          ),
        ),
        Icon(Icons.arrow_drop_down)
      ],
    );
  }
}
