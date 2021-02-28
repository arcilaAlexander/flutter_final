import 'package:flutter/material.dart';
import 'package:flutter_app1/view/login_page.dart';
import 'package:flutter_app1/view/news_page.dart';

void main() {
  //se inicializa la base de datos antes de correr la aplicacion

  //corre la aplicacion
  runApp(MyApp());
}

//stylewidget, muestra imagesnes
//statefulwidget wigdet con estado

//comando stf
class Widgetsstate extends StatefulWidget {
  String name;
  Widgetsstate({this.name});
  @override
  _WidgetsstateState createState() => _WidgetsstateState();
}

class _WidgetsstateState extends State<Widgetsstate> {
  var variable = Widgetsstate().name;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//widget sin estado stl
class WidgetSinEstado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: (settign) {
        switch (settign.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => new LoginPage());
          case '/news':
            return MaterialPageRoute(builder: (context) => new NewsPage());
          default:
            return null;
        }
      },
    );
  }
}
