import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/movieBloc/movieVideoBloc/bloc.dart';
import 'package:movie_max/src/repository/movieRepository.dart';
import 'package:movie_max/src/models/videoModels/itemVideo.dart';


class MovieVideoBloc extends Bloc<MovieVideoEvent, MovieVideoState>
{

  MovieRepository movieRepository;

  MovieVideoBloc({@required this.movieRepository});

  @override  
  MovieVideoState get initialState => MovieVideoInitialState();

  @override
  Stream<MovieVideoState> mapEventToState(MovieVideoEvent event) async*{    

    if(event is FetchMovieVideoEvent){
      yield MovieVideoLoadingState();
      try{
        ItemVideo data =  await movieRepository.fetchAllMovieVideo(event.id);
        yield MovieVideoLoadedState(data: data);
      }
      catch(e){
        yield MovieVideoErrorState(message: e.toString());
      }            
    }    

  }

}


