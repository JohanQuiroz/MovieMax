import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MovieVideoEvent extends Equatable{
  const MovieVideoEvent();
}

class FetchMovieVideoEvent extends MovieVideoEvent{
  final int id;

  FetchMovieVideoEvent({@required this.id});

  @override  
  List<Object> get props => [id];
}
