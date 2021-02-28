import 'package:flutter_app1/models/news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard extends StatelessWidget {
  final News news;
  final Function(News) onTapFav;
  NewsCard({Key key, @required this.news, this.onTapFav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: MediaQuery.of(context).size.height / 1.72,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white38,
          boxShadow: [
            BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.black12)
          ]),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: news.urlToImage != null
                        ? NetworkImage(news.urlToImage)
                        : AssetImage('assets/img/estadio_blanco.png'))),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(news.title ?? 'Sin titutlo',
                      maxLines: 3,
                      style: GoogleFonts.signika(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text(news.author ?? 'Sin estadio',
                      style: GoogleFonts.signika(
                          fontSize: 20,
                          color: Colors.black45,
                          fontWeight: FontWeight.normal)),
                  Container(
                    height: 10,
                  ),
                  Text(news.description ?? 'Sin descirpcion',
                      maxLines: 6,
                      style: GoogleFonts.signika(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
