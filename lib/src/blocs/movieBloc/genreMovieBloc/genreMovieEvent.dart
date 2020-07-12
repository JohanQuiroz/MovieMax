import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class GenreMovieEvent extends Equatable{
  const GenreMovieEvent();
}

class FetchGenreMovieEvent extends GenreMovieEvent{
  @override  
  List<Object> get props => null;
}


class FetchMovieByGenreEvent extends GenreMovieEvent{
  final int id;

  const FetchMovieByGenreEvent({@required this.id});

  @override  
  List<Object> get props => [id];
}