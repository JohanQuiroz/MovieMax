import 'package:flutter/material.dart';
import 'package:movie_max/src/pages/login/InicioSesion.dart';
import 'package:movie_max/src/pages/login/RegistroCuenta.dart';
import 'package:movie_max/src/pages/login/LoginInicio.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LoginInicio(),
      routes: {
        'InicioSesion' : (context) => InicioSesion(),       
        'RegistroCuenta' : (context) => RegistroCuenta() 
      },
    );
  }
}