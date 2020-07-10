import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override  
  List<Object> get props => [];
}

// Se crea 5 eventos:
// Email changed

class EmailChanged extends RegisterEvent{
  final String email;

  const EmailChanged({@required this.email});

  @override  
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged {email: $email}';
}
// Password Changed

class PasswordChanged extends RegisterEvent{
  final String password;

  const PasswordChanged({@required this.password});

  @override  
  List<Object> get props => [password];
 
  @override
  String toString() => 'PasswordChanged {password: $password}';

}
// Submited

class Submitted extends RegisterEvent{
  final String email;
  final String password;

  const Submitted({@required this.email, @required this.password});

  @override  
  List<Object> get props => [email, password];

  @override
  String toString() => 'Submitted {email: $email , password: $password}';
}