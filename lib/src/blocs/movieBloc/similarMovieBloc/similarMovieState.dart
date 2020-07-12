import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_max/src/models/movieModels/itemMovieModel.dart';

abstract class SimilarMovieState extends Equatable{

}

class SimilarMovieInitialState extends SimilarMovieState{
  @override  
  List<Object> get props => [];

}

class SimilarMovieLoadingState extends SimilarMovieState{
  @override  
  List<Object> get props => [];
}

class SimilarMovieLoadedState extends SimilarMovieState{

  ItemMovieModel movies;

  SimilarMovieLoadedState({@required this.movies});

  @override  
  List<Object> get props => [];
}

class SimilarMovieErrorState extends SimilarMovieState{

  String message;
  
  SimilarMovieErrorState({@required this.message});

  @override  
  List<Object> get props => [];
}