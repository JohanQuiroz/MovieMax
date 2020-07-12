import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class NowMovieEvent extends Equatable{
  const NowMovieEvent();
}

class FetchNowMovieEvent extends NowMovieEvent{
  @override  
  List<Object> get props => null;
}

