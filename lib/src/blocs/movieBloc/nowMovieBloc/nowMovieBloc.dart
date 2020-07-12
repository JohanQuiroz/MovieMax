import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/movieBloc/nowMovieBloc/bloc.dart';
import 'package:movie_max/src/models/movieModels/itemMovieModel.dart';
import 'package:movie_max/src/models/genreModels/itemGenreModel.dart';
import 'package:movie_max/src/repository/movieRepository.dart';
import 'package:rxdart/rxdart.dart';

class NowMovieBloc extends Bloc<NowMovieEvent, NowMovieState>
{

  MovieRepository movieRepository;

  NowMovieBloc({@required this.movieRepository});

  @override
  // TODO: implement initialState
  NowMovieState get initialState => NowMovieInitialState();

  @override
  Stream<NowMovieState> mapEventToState(NowMovieEvent event) async*{    

    if(event is FetchNowMovieEvent){
      yield NowMovieLoadingState();
      try{
        ItemMovieModel movies =  await movieRepository.fetchAllMoviesPopular();
        yield NowMovieLoadedState(movies: movies);
      }
      catch(e){
        yield NowMovieErrorState(message: e.toString());
      }            
    }    

  }

}