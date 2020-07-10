import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override  
  List<Object> get props => [];
}

//Se crea 3 eventos

//App Started
class AppStarted extends AuthenticationEvent{}

//LoggedIn
class LoggedIn extends AuthenticationEvent{}

//LoggedOut
class LoggedOut extends AuthenticationEvent{}