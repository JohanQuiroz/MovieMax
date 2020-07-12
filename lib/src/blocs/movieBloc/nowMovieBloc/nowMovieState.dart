 import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_max/src/models/movieModels/itemModel.dart';
import 'package:movie_max/src/models/genreModels/itemGenreModel.dart';
import 'package:movie_max/src/models/movieModels/resultModel.dart';

abstract class NowMovieState extends Equatable{

}

class NowMovieInitialState extends NowMovieState{
  @override  
  List<Object> get props => [];

}

class NowMovieLoadingState extends NowMovieState{
  @override  
  List<Object> get props => [];
}

class NowMovieLoadedState extends NowMovieState{

  ItemModel movies;

  NowMovieLoadedState({@required this.movies});

  @override  
  List<Object> get props => [];
}

class NowMovieErrorState extends NowMovieState{

  String message;
  
  NowMovieErrorState({@required this.message});

  @override  
  List<Object> get props => [];
}