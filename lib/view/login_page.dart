import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils/colors.dart';
import 'package:flutter_app1/utils/sign_in_google.dart';
import 'package:flutter_app1/utils/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app1/utils/resize.dart';
import 'package:flutter_app1/view/widgets/app_button.dart';
import 'package:flutter_app1/view/widgets/app_text_field.dart';
import 'package:flutter_app1/utils/firebaseController.dart' as firebaseAuth;
import 'package:flutter_app1/utils/sign_in_google.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _textEditingControllerEmail =
      new TextEditingController();
  final TextEditingController _textEditingControllerPassword =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var _Height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    firebaseAuth.Initializing();
    //Navigator.of(context); // permite saber la pagina de la navegacion
    //Scaffold.of(context); // mensaje snakbar o toast para
    // mostrar mensajes se saca del scaffold - es un widget
    // estrcutura repetitiva en las pantallas
    // todas la pantallas deben tener un scaffold es la estructura principal
    // de cada pantalla
    //siempre hacer un scaffold que es el lienzo
    return Scaffold(
        body: Container(
      child: Stack(
        //sobre ponder widget
        children: [
          Container(
            //mediaquery agarra el ancho del celular
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/fondo.jpg'),
                  colorFilter: ColorFilter.mode(Colors.white10,
                      BlendMode.softLight) // da la opacacidad a la imagen
                  ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: colorBlanco.withAlpha(100),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: resizeH(mediaQ: _Height, size: 80),
                    left: 25,
                    right: 25), //damos un espacio al contenedor
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/img/img3.png',
                        width: resizeH(mediaQ: _Height, size: 250),
                        height: resizeH(mediaQ: _Height, size: 100),
                        fit: BoxFit.contain),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    /*
                    Container(
                      //margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.all(width * 0.1),
                      color: Colors.yellow,
                      child: Text(
                        "Example",
                        style: Styles.primaryTextStyles,
                      ),
                    ),
                     */
                    Align(
                      //solo sirve para stack
                      alignment: Alignment.center,
                      child: AppTextField(
                        controller: _textEditingControllerEmail,
                        hintText: 'Usuario',
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _Height * 0.02,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: AppTextField(
                          controller: _textEditingControllerPassword,
                          hintText: 'Clave',
                          icon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          obscureText: true,
                        )),
                    SizedBox(
                      height: _Height * 0.01,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: AppButton(
                        text: 'Ingresar',
                        onPressed: () {
                          if (_textEditingControllerEmail.text.isEmpty ||
                              _textEditingControllerPassword.text.isEmpty) {
                            firebaseAuth.showMaterialDialog(
                                context: context, message: 'Llene los datos');
                          } else {
                            print(_textEditingControllerEmail.text);
                            print(_textEditingControllerPassword.text);
                            //hacer logica de logueo
                            firebaseAuth.signIn(
                                email: _textEditingControllerEmail.text,
                                password: _textEditingControllerPassword.text,
                                context: context);
                            firebaseAuth.stateFirebase(context: context);
                            //Navigator.pushReplacementNamed(context, '/news');
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 500,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1000,
                child: SizedBox(),
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: RaisedButton(
                  padding: EdgeInsets.all(2),
                  color: Colors.transparent,
                  onPressed: () {
                    signInWithGoogle2().then((result) {
                      print('--------------------------------');
                      //print(result);
                      if (result != null) {
                        Navigator.pushNamed(context, '/news');
                      }
                    });
                  },
                  child: Image.asset('assets/img/Google-Sign-In.png'),
                ),
              ),
              Expanded(
                flex: 1000,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
