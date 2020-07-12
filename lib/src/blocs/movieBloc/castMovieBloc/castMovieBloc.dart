import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/movieBloc/castMovieBloc/bloc.dart';
import 'package:movie_max/src/repository/movieRepository.dart';
import 'package:movie_max/src/models/detailMovieModels/itemCast.dart';

class CastMovieBloc extends Bloc<CastMovieEvent, CastMovieState>
{

  MovieRepository movieRepository;

  CastMovieBloc({@required this.movieRepository});

  @override  
  CastMovieState get initialState => CastMovieInitialState();

  @override
  Stream<CastMovieState> mapEventToState(CastMovieEvent event) async*{    

    if(event is FetchCastMovieEvent){
      yield CastMovieLoadingState();
      try{
        ItemCast data =  await movieRepository.fetchAllCastsMovie(event.id);
        yield CastMovieLoadedState(data: data);
      }
      catch(e){
        yield CastMovieErrorState(message: e.toString());
      }            
    }    

  }

}