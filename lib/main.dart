import 'package:flutter/material.dart';
import 'package:movie_max/src/pages/login/InicioSesion.dart';
import 'package:movie_max/src/pages/login/RegistroCuenta.dart';
import 'package:movie_max/src/pages/login/LoginInicio.dart';
import 'package:movie_max/src/pages/movies/PaginaPrincipal.dart';
import 'package:movie_max/src/pages/movies/MenuControllerBar.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moviemax',
      home: LoginInicio(),
      routes: {                
        'InicioSesion' : (context) => InicioSesion(),       
        'RegistroCuenta' : (context) => RegistroCuenta(),
        'PaginaPrincipal' : (context) => PaginaPrincipal(),
        'MenuControllerBar' : (context) => MenuControllerBar()
      },
    );
  }
}