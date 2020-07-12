import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/movieBloc/similarMovieBloc/bloc.dart';
import 'package:movie_max/src/models/movieModels/itemMovieModel.dart';
import 'package:movie_max/src/repository/movieRepository.dart';

class SimilarMovieBloc extends Bloc<SimilarMovieEvent, SimilarMovieState>
{

  MovieRepository movieRepository;

  SimilarMovieBloc({@required this.movieRepository});

  @override  
  SimilarMovieState get initialState => SimilarMovieInitialState();

  @override
  Stream<SimilarMovieState> mapEventToState(SimilarMovieEvent event) async*{    

    if(event is FetchSimilarMovieEvent){
      yield SimilarMovieLoadingState();
      try{
        ItemMovieModel movies =  await movieRepository.fetchAllMovieSimilar(event.id);
        yield SimilarMovieLoadedState(movies: movies);
      }
      catch(e){
        yield SimilarMovieErrorState(message: e.toString());
      }            
    }    

  }

}