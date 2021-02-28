import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/models/news.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard_backup extends StatelessWidget {
  final News news;
  final Function(News) onTapFav;
  NewsCard_backup({Key key, @required this.news, this.onTapFav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: MediaQuery.of(context).size.height / 1.72,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                //sombreado
                blurRadius: 2,
                spreadRadius: 2, //matiz del sombreado
                color: Colors.black12)
          ]),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            //para colocar la imagen en un contenedor
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
                        : AssetImage('assets/img/img3.png'))),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(news.title ?? 'Sin titulo',
                      maxLines: 3,
                      style: GoogleFonts.signika(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text(news.author ?? 'Sin autor',
                      style: GoogleFonts.signika(
                          fontSize: 14,
                          color: Colors.black45,
                          fontWeight: FontWeight.normal)),
                  Container(
                    height: 10,
                  ),
                  Text(news.description ?? 'Sin descripcion',
                      maxLines: 3,
                      style: GoogleFonts.signika(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 13, left: 13),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, //centra vertical
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, //centra horizontal
                children: [
                  IconButton(
                      icon: Icon(Icons.favorite_border_outlined),
                      onPressed: () {}),
                  InkWell(
                    //le da gestos a un widget
                    child: Text(
                      'Mas',
                      style: GoogleFonts.signika(
                          fontSize: 14,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

    /*
    return Card(
      child: Column(
        children: [
          Container(
            //para colocar la imagen en un contenedor
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
                        : AssetImage('assets/img/img3.png'))),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  news.title ?? 'Sin titulo',
                  maxLines: 3,
                  style: GoogleFonts.signika(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  news.author ?? 'Sin autor',
                  style: GoogleFonts.signika(
                      fontSize: 14,
                      color: Colors.black45,
                      fontWeight: FontWeight.normal),
                ),
                Container(
                  //Contenedor para espacio
                  height: 10,
                ),
                Text(
                  news.description ?? 'Sin descripcion',
                  style: GoogleFonts.signika(
                      fontSize: 12,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20, left: 13),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, //centra vertical
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, //centra horizontal
                children: [
                  IconButton(
                      icon: Icon(Icons.favorite_border_outlined),
                      onPressed: () {}),
                  InkWell(
                    //le da gestos a un widget
                    child: Text(
                      'MORE',
                      style: GoogleFonts.signika(
                          fontSize: 14,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );*/
  }
}
