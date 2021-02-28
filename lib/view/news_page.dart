// statelesswidget cuando la vista es estatica no cambia
// statefulwidget cuanod la vista es dinamica y cambia como mensajes de alerta - evitar usarlos mucho por que recosntruye la aplicacion
// siempre se crea primero stateful widget - contenido dinamico
// se puede crear stalleswidget
// ambas estan atadas a Statemanagment -> implementa provider
// Riverpod (provider 2.0)
// BlocLibrary.dev
//permite adminsitrar arquitectura para darle orden

import 'package:flutter/material.dart';
import 'package:flutter_app1/data/news_repository.dart';
import 'package:flutter_app1/presenter/build_view.dart';
import 'package:flutter_app1/utils/styles.dart';
import 'package:flutter_app1/view/widgets/new_card-backup.dart';
import 'package:flutter_app1/models/news.dart';
import 'package:flutter_app1/view/widgets/drawer_option.dart';
import 'package:flutter_app1/utils/firebaseController.dart' as firebaseAuth;

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int intNews = 1;

  String viewName = 'NewsList';
  static const drawerOptions = <Map<String, dynamic>>[
    {'value': 1, 'text': 'Equipos de futbol'},
    /*
    {'value': 2, 'text': 'Top business headlines in the US right now'},
    {
      'value': 3,
      'text':
          'All articles mentioning Apple from yesterday, sorted by popular publishers first'
    },
    {'value': 4, 'text': 'Top headlines from TechCrunch right now'},
    {
      'value': 5,
      'text':
          'All articles published by the Wall Street Journal in the last 6 months, sorted by recent first'
    },*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Equipos",
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: Drawer(
        //Despliega la seccion del menu
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
            ),
            DrawerHeader(
              padding: const EdgeInsets.all(100),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/img/img3.png'),
                    colorFilter: ColorFilter.mode(Colors.transparent,
                        BlendMode.softLight) // da la opacacidad a la imagen
                    ),
              ),

              /*
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.black12,
                  backgroundImage: AssetImage("assets/img/img3.png"),
                )*/
            ),
            ...drawerOptions
                .map((option) => DrawerOption(
                      text: option['text'],
                      onTap: () {
                        setState(() {
                          intNews = option['value'];
                          Navigator.pop(context);
                        });
                      },
                    ))
                .toList(),
            ListTile(
              title: Text('Salir',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red,
                  )),
              onTap: () {
                firebaseAuth.signOut(context);
              },
            )
            //muestra el menu
            /*
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Text(
                  "> Este es otro ",
                  style: Styles.drawerOptionStyle,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(13),
              child: Text(
                "> Todos los arcticulos sobre Colombia",
                style: Styles.drawerOptionStyle,
              ),
            ),
            */
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/img/fondo2.jpg'),
              colorFilter: ColorFilter.mode(Colors.white60,
                  BlendMode.hardLight) // da la opacacidad a la imagen
              ),
        ),
        padding: EdgeInsets.only(right: 10, left: 10),
        child: BuildView(
          viewName: viewName,
          intNews: intNews,
        ),
        /*
        child: ListView(
          children: NewsRepository()
              .NEWS
              .map((news) => NewsCard(
                    news: news,
                  ))
              .toList(),
        ),*/
      ),
    );
  }
}
