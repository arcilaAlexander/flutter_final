import 'package:flutter/material.dart';

//PAra parametros opcionales los ponemos dentro de llaves
double resizeH({@required double mediaQ, @required double size}) {
  var result = mediaQ / size;
  return mediaQ / result;
}
