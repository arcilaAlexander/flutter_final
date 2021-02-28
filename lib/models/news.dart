import 'package:flutter/material.dart';
import 'package:flutter_app1/utils/styles.dart';

class NewsApiModel {
  String status;
  int totalResults;
  List<News> articlesList;

  NewsApiModel(this.status, this.totalResults, this.articlesList);

  NewsApiModel.fromjson(Map<String, dynamic> map) {
    //var mapArticles = map['articles'] as List;
    var mapArticles = map['teams'] as List;
    print(mapArticles);

    status = 'ok';
    //totalResults = map['totalResults'];
    totalResults = 100;
    articlesList = mapArticles.map((json) => News.fromjson(json)).toList();
    print('-----------modelo--------------------------------------');
    print(this.articlesList);
    /*
    articlesList =
        mapArticles.map((json) => News.fromjson(json)).cast<News>().toList();

     */
  }
}

class News {
  String name;
  String image;
  String title;
  String author;
  String description;
  String url;
  String urlToImage;
  String content;
  String publishedAt;
  Source source;

  News(
      {this.image,
      this.title,
      this.author,
      this.description,
      this.url,
      this.urlToImage,
      this.content,
      this.publishedAt});

  News.fromjson(Map<String, dynamic> map) {
    source = Source.fromjson(map);

    //author = map['author'];
    author = map['strStadium'];
    //title = map['title'];
    title = map['strTeam'];
    description = map['strStadiumDescription'];
    //content = map['content'];
    content = map['name'];
    url = map['url'];
    urlToImage = map['strStadiumThumb'];
    publishedAt = map['publishedAt'];
  }
}

class Source {
  String id;
  String name;

  Source(this.id, this.name);

  Source.fromjson(Map<String, dynamic> map) {
    id = map['intStadiumCapacity'];
    name = map['strWebsite'];
  }
}
