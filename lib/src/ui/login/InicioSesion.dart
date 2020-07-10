import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/loginBloc/loginBloc.dart';
import 'package:movie_max/src/ui/login/LoginForm.dart';
import 'package:movie_max/src/repository/userRepository.dart';

class InicioSesion extends StatelessWidget {

  final UserRepository _userRepository;

  InicioSesion({Key key, @required UserRepository userRepository})
    :assert(userRepository!=null),
    _userRepository = userRepository,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: _userRepository),
        child: LoginForm(userRepository: _userRepository),
        
      ),                
    );
  }
}
