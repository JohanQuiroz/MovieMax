import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MovieDetailEvent extends Equatable{
  const MovieDetailEvent();
}

class FetchMovieDetailEvent extends MovieDetailEvent{
  final int id;

  FetchMovieDetailEvent({@required this.id});

  @override  
  List<Object> get props => [id];
}
