import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_max/src/models/videoModels/itemVideo.dart';

abstract class MovieVideoState extends Equatable{

}

class MovieVideoInitialState extends MovieVideoState{
  @override  
  List<Object> get props => [];

}

class MovieVideoLoadingState extends MovieVideoState{
  @override  
  List<Object> get props => [];
}

class MovieVideoLoadedState extends MovieVideoState{

  ItemVideo data;

  MovieVideoLoadedState({@required this.data});

  @override  
  List<Object> get props => [];
}

class MovieVideoErrorState extends MovieVideoState{

  String message;
  
  MovieVideoErrorState({@required this.message});

  @override  
  List<Object> get props => [];
}