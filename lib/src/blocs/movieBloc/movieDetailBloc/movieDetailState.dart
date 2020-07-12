import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_max/src/models/detailMovieModels/itemMovieDetail.dart';

abstract class MovieDetailState extends Equatable{

}

class MovieDetailInitialState extends MovieDetailState{
  @override  
  List<Object> get props => [];

}

class MovieDetailLoadingState extends MovieDetailState{
  @override  
  List<Object> get props => [];
}

class MovieDetailLoadedState extends MovieDetailState{

  ItemMovieDetail movieDetail;

  MovieDetailLoadedState({@required this.movieDetail});

  @override  
  List<Object> get props => [];
}

class MovieDetailErrorState extends MovieDetailState{

  String message;
  
  MovieDetailErrorState({@required this.message});

  @override  
  List<Object> get props => [];
}