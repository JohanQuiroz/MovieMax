import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SimilarMovieEvent extends Equatable{
  const SimilarMovieEvent();
}

class FetchSimilarMovieEvent extends SimilarMovieEvent{
  final int id;

  FetchSimilarMovieEvent({@required this.id});

  @override  
  List<Object> get props => [id];
}
