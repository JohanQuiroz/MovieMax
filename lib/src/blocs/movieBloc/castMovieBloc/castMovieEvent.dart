import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class CastMovieEvent extends Equatable{
  const CastMovieEvent();
}

class FetchCastMovieEvent extends CastMovieEvent{
  final int id;

  FetchCastMovieEvent({@required this.id});

  @override  
  List<Object> get props => [id];
}
