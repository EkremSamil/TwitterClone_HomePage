import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tabbar_view.dart';

class HomeView extends StatefulWidget {
  HomeView(this.controller);
  final ScrollController controller;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int defultTabLength = 4;
  bool isHeaderClose = false;
  double lastOffSet = 0;
  // String _networkImg = "https://picsum.photos/50";
  String dummyTweet =
      "Dogs suffer from the same common disorders as humans; these include cancer, diabetes, heart disease and neurologic disorders. Their pathology is similar to humans, as is their response to treatment and their outcomes.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fabButton,
      body: _listViewB,
    );
  }

  Widget get _listViewB => ListView.builder(
        padding: EdgeInsets.only(
          top: 5,
          bottom: 25,
        ),
        itemCount: 10,
        controller: widget.controller,
        itemBuilder: (context, index) {
          return _listViewCard;
        },
      );

  Widget get _listViewCard => Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("image/dog.jpg"),
          ),
          title: Wrap(
            direction: Axis.horizontal,
            runSpacing: 4,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 5,
                  right: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _listCardTitle("User"),
                    Icon(Icons.more_horiz),
                  ],
                ),
              ),
              Text(dummyTweet),
              _placeHolderField,
              _footerButtonRow,
            ],
          ),
        ),
      );

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      );

  Widget _listCardTitle(String text) => Text(
        text,
        style: titleTextStyle,
      );

  Widget get _placeHolderField => Container(
        width: 250,
        height: 225,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/dog.jpg"),
            fit: BoxFit.contain,
          ),
        ),
      );

  Widget get _footerButtonRow => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconLabelButton,
          _iconLabelRepeat("2"),
          _iconLabelLike("4"),
          _iconLabelShare(""),
        ],
      );

  Widget _iconLabel(String text) => Wrap(
        spacing: 5,
        children: [
          Icon(
            Icons.comment,
          ),
          Text(text)
        ],
      );

  Widget _iconLabelShare(String text) => Wrap(
        spacing: 5,
        children: [
          Icon(
            Icons.share,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text)
        ],
      );
  Widget _iconLabelRepeat(String text) => Wrap(
        spacing: 5,
        children: [
          Icon(
            CupertinoIcons.arrow_2_squarepath,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text)
        ],
      );
  Widget _iconLabelLike(String text) => Wrap(
        spacing: 5,
        children: [Icon(CupertinoIcons.heart), Text(text)],
      );

  Widget get _iconLabelButton => InkWell(
        child: _iconLabel("1"),
        onTap: () {},
      );
}
