
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/models/movieModels/itemModel.dart';
import 'package:movie_max/src/repository/movieRepository.dart';
import 'package:movie_max/src/blocs/movieBloc/popularMovieBloc/bloc.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState>
{

  MovieRepository movieRepository;

  PopularMovieBloc({@required this.movieRepository});

  @override
  // TODO: implement initialState
  PopularMovieState get initialState => PopularMovieInitialState();

  @override
  Stream<PopularMovieState> mapEventToState(PopularMovieEvent event) async*{    

    if(event is FetchPopularMovieEvent){
      yield PopularMovieLoadingState();
      try{
        ItemModel movies =  await movieRepository.fetchAllMoviesPlayingNow();
        yield PopularMovieLoadedState(movies: movies);
      }
      catch(e){
        yield PopularMovieErrorState(message: e.toString());
      }            
    }    

  }

}