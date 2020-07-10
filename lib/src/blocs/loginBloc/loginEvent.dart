import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_max/src/blocs/loginBloc/bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override  
  List<Object> get props => [];
}

// Se crea 5 eventos:
// Email changed

class EmailChanged extends LoginEvent{
  final String email;

  const EmailChanged({@required this.email});

  @override  
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged {email: $email}';
}
// Password Changed

class PasswordChanged extends LoginEvent{
  final String password;

  const PasswordChanged({@required this.password});

  @override  
  List<Object> get props => [password];
 
  @override
  String toString() => 'PasswordChanged {password: $password}';

}
// Submited

class Submitted extends LoginEvent{
  final String email;
  final String password;

  const Submitted({@required this.email, @required this.password});

  @override  
  List<Object> get props => [email, password];

  @override
  String toString() => 'Submitted {email: $email , password: $password}';
}

// Login With Google Pressed

class LoginWithGooglePressed extends LoginEvent{}

// Login with credentials pressed

class LoginWithCredentialsPressed extends LoginEvent{
  
  final String email;
  final String password;

  const LoginWithCredentialsPressed({@required this.email, @required this.password});

  @override  
  List<Object> get props => [email, password];

  @override
  String toString() => 'Submitted {email: $email , password: $password}';
}