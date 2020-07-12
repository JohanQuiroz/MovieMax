import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/movieBloc/genreMovieBloc/bloc.dart';
import 'package:movie_max/src/repository/movieRepository.dart';
import 'package:movie_max/src/models/genreModels/itemGenreModel.dart';
import 'package:movie_max/src/models/movieModels/itemMovieModel.dart';

class GenreMovieBloc extends Bloc<GenreMovieEvent, GenreMovieState>
{

  MovieRepository movieRepository;

  GenreMovieBloc({@required this.movieRepository});

  @override  
  GenreMovieState get initialState => GenreMovieInitialState();

  @override
  Stream<GenreMovieState> mapEventToState(GenreMovieEvent event) async*{    

    if(event is FetchGenreMovieEvent){
      yield GenreMovieLoadingState();
      try{
        ItemGenreModel genres =  await movieRepository.fecthAllMovieGenres();
        yield GenreMovieLoadedState(data: genres);
      }
      catch(e){
        yield GenreMovieErrorState(message: e.toString());
      }            
    }    

    if(event is FetchMovieByGenreEvent){
      yield GenreMovieLoadingState();
      try{
        ItemMovieModel movies =  await movieRepository.fetchAllMoviesByGenre(event.id);
        yield MovieByGenreLoadedState(movies: movies);
      }
      catch(e){
        yield GenreMovieErrorState(message: e.toString());
      }            
    }

  }

}