import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/movieBloc/movieDetailBloc/bloc.dart';
import 'package:movie_max/src/repository/movieRepository.dart';
import 'package:movie_max/src/models/detailMovieModels/itemMovieDetail.dart';


class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState>
{

  MovieRepository movieRepository;

  MovieDetailBloc({@required this.movieRepository});

  @override  
  MovieDetailState get initialState => MovieDetailInitialState();

  @override
  Stream<MovieDetailState> mapEventToState(MovieDetailEvent event) async*{    

    if(event is FetchMovieDetailEvent){
      yield MovieDetailLoadingState();
      try{
        ItemMovieDetail movieDetail =  await movieRepository.fetchAllMovieDetails(event.id);
        yield MovieDetailLoadedState(movieDetail: movieDetail);
      }
      catch(e){
        yield MovieDetailErrorState(message: e.toString());
      }            
    }    

  }

}


