import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_max/src/models/movieModels/itemModel.dart';

abstract class PopularMovieState extends Equatable{

}

class PopularMovieInitialState extends PopularMovieState{
  @override  
  List<Object> get props => [];

}

class PopularMovieLoadingState extends PopularMovieState{
  @override  
  List<Object> get props => [];
}

class PopularMovieLoadedState extends PopularMovieState{

  ItemModel movies;

  PopularMovieLoadedState({@required this.movies});

  @override  
  List<Object> get props => [];
}

class PopularMovieErrorState extends PopularMovieState{

  String message;
  
  PopularMovieErrorState({@required this.message});

  @override  
  List<Object> get props => [];
}