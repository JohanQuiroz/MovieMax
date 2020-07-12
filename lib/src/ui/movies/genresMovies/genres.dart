import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/models/genreModels/itemGenreModel.dart';
import 'package:movie_max/src/ui/movies/genresMovies/genresListMovies.dart';
import 'package:movie_max/src/blocs/movieBloc/genreMovieBloc/bloc.dart';

class Genres extends StatefulWidget {
  @override
  _GenresState createState() => _GenresState();

}

class _GenresState extends State<Genres> {
  
  GenreMovieBloc genreMovieBloc;  

  @override
  void initState() {    
    super.initState();
    genreMovieBloc = BlocProvider.of<GenreMovieBloc>(context);
    genreMovieBloc.add(FetchGenreMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GenreMovieBloc, GenreMovieState>(
          listener: (context, state) {                                                           
            if(state is GenreMovieErrorState){
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(_renderError(state.message));                
            }                           
          },  
          child: BlocBuilder<GenreMovieBloc, GenreMovieState>(            
            builder: (context, state){
              if(state is GenreMovieInitialState)
                return _renderLoading();
              else if(state is GenreMovieLoadingState)
                return _renderLoading();     
              else if (state is GenreMovieLoadedState){
                return _renderMovies(state.data, context);
              }                                                                        
            },
          ),      
      );  
  }

  Widget _renderLoading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _renderError(String m){
    return SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(m),
          Icon(Icons.error)
        ],
      ),
      backgroundColor: Colors.red,      
    );
  }
  

  Widget _renderMovies(ItemGenreModel data, BuildContext context){
    print(data.genres[0]);
    if(data.genres.length == 0){
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('NO Genres')
          ],
        ),
      );
    }
    else{
        return GenresListMovies(genres: data.genres);
    }
  }

}