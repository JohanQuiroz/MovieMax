import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_max/src/blocs/simpleBlocDelegate.dart';
import 'package:movie_max/src/pages/builderBloc.dart';
import 'package:movie_max/src/pages/login/InicioSesion.dart';
import 'package:movie_max/src/pages/movies/MenuControllerBar.dart';
import 'package:movie_max/src/pages/movies/PaginaPrincipal.dart';
import 'package:movie_max/src/pages/register/RegistroCuenta.dart';
import 'package:movie_max/src/pages/splashScreen/splashScreen.dart';

import 'package:movie_max/src/repository/userRepository.dart';
import 'package:movie_max/src/blocs/authenticationBloc/bloc.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository)
        ..add(AppStarted()),
      child: MyApp(userRepository : userRepository),
    )
  );
} 

 
class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  MyApp({Key key, @required UserRepository userRepository })
    : assert(userRepository != null),
      _userRepository = userRepository,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moviemax',
      home: SplashScreen(),
      routes: {       
        'Builder' : (context) => BuilderBloc(userRepository: _userRepository,),    
        'InicioSesion' : (context) => InicioSesion(userRepository: _userRepository,),       
        'RegistroCuenta' : (context) => RegistroCuenta(userRepository: _userRepository,),
        'PaginaPrincipal' : (context) => PaginaPrincipal(),
        'MenuControllerBar' : (context) => MenuControllerBar()
      },
    );
  }
}