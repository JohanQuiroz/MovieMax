import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_max/src/models/detailMovieModels/itemCast.dart';

abstract class CastMovieState extends Equatable{

}

class CastMovieInitialState extends CastMovieState{
  @override  
  List<Object> get props => [];

}

class CastMovieLoadingState extends CastMovieState{
  @override  
  List<Object> get props => [];
}

class CastMovieLoadedState extends CastMovieState{

  ItemCast data;

  CastMovieLoadedState({@required this.data});

  @override  
  List<Object> get props => [];
}

class CastMovieErrorState extends CastMovieState{

  String message;
  
  CastMovieErrorState({@required this.message});

  @override  
  List<Object> get props => [];
}