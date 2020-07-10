import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/authenticationBloc/bloc.dart';
import 'package:movie_max/src/ui/login/InicioSesion.dart';
import 'package:movie_max/src/ui/movies/MenuControllerBar.dart';
import 'package:movie_max/src/repository/userRepository.dart';

class BuilderBloc extends StatelessWidget {

  final UserRepository _userRepository;

  BuilderBloc({Key key, @required UserRepository userRepository })
    : assert(userRepository != null),
      _userRepository = userRepository,
      super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state){
          if(state is Uninitialized)
            return Scaffold(backgroundColor: Colors.black,);
          if(state is Authenticated)
            return MenuControllerBar();
          if(state is Unauthenticated)
            return InicioSesion(userRepository: _userRepository,);
        },
    );
  }
}