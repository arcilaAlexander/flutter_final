import 'package:flutter/material.dart';
import 'package:flutter_app1/models/news.dart';
import 'package:flutter_app1/view/widgets/news_card.dart';

class BiuldItemList extends StatelessWidget {
  final News snapshotData;
  final Function(News) onTapFav;

  //key para que no repita los items
  BiuldItemList({Key key, @required this.snapshotData, this.onTapFav});

  @override
  Widget build(BuildContext context) {
    print('BiuldItemList-----------------');
    print(snapshotData);
    return NewsCard(
      news: snapshotData,
      onTapFav: onTapFav,
    );
  }
}
