
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_max/src/models/genreModels/itemGenreModel.dart';
import 'package:movie_max/src/models/movieModels/itemMovieModel.dart';

abstract class GenreMovieState extends Equatable{

}

class GenreMovieInitialState extends GenreMovieState{
  @override  
  List<Object> get props => [];

}

class GenreMovieLoadingState extends GenreMovieState{
  @override  
  List<Object> get props => [];
}

class GenreMovieLoadedState extends GenreMovieState{

  ItemGenreModel data;

  GenreMovieLoadedState({@required this.data});

  @override  
  List<Object> get props => [];
}

class MovieByGenreLoadedState extends GenreMovieState{
  ItemMovieModel movies;
  

  MovieByGenreLoadedState({@required this.movies});

  @override  
  List<Object> get props => null;
}

class GenreMovieErrorState extends GenreMovieState{

  String message;
  
  GenreMovieErrorState({@required this.message});

  @override  
  List<Object> get props => [];
}