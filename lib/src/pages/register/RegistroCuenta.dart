import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/registerBloc/bloc.dart';
import 'package:movie_max/src/pages/register/RegistroForm.dart';
import 'package:movie_max/src/repository/userRepository.dart';

class RegistroCuenta extends StatelessWidget {
  final UserRepository _userRepository;

  RegistroCuenta({Key key, @required UserRepository userRepository})
    :assert(userRepository!=null),
    _userRepository = userRepository,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
       body: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(userRepository: _userRepository),
        child: RegistroForm(userRepository: _userRepository),        
      ),                       
    );
  }
}