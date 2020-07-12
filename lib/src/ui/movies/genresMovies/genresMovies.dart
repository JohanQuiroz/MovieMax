import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_max/src/blocs/movieBloc/movieVideoBloc/bloc.dart';
import 'package:movie_max/src/models/movieModels/itemMovieModel.dart';
import 'package:movie_max/src/models/movieModels/resultMovieModel.dart';
import 'package:movie_max/src/blocs/movieBloc/genreMovieBloc/bloc.dart';
import 'package:movie_max/src/ui/movies/detailMovies/detailsMovie.dart';
import 'package:movie_max/src/repository/movieRepository.dart';

class GenresMovies extends StatefulWidget {
  final int genreId;

  GenresMovies({Key key, @required this.genreId})
    :super(key:key);

  @override
  _GenresMoviesState createState() => _GenresMoviesState(genreId);
}

class _GenresMoviesState extends State<GenresMovies> {
  final int genreId;
  GenreMovieBloc genreMovieBloc;
  ItemMovieModel itemMovie;

  _GenresMoviesState(this.genreId);

  @override
  void initState() {    
    super.initState();
    genreMovieBloc = BlocProvider.of<GenreMovieBloc>(context);
    genreMovieBloc.add(FetchMovieByGenreEvent(id: genreId));
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        //padding: EdgeInsets.all(10),
        child: BlocListener<GenreMovieBloc, GenreMovieState>(
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
              else if (state is MovieByGenreLoadedState){
                return _renderGenresMoviesById(state.movies, context);
              }
                                                                             
            },
          ),
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

   Widget _renderItems(List<ResultMovieModel> results){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: results.length,
      itemBuilder: (context, index){
        return Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) =>  BlocProvider(
                  create : (context) => MovieVideoBloc(movieRepository: MovieRepository()),
                  child: DetailsMovie(resultMovie: results[index]),
                ) 
              ));
            },
            child: Column(
              children: <Widget>[
                results[index].posterPath == null ? 
                Container(
                  width: 120.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4C10F),
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                    shape: BoxShape.rectangle
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.play_arrow, color: Colors.white, size: 50.0,)
                    ],
                  ),
                ) : 
                Container(
                  width: 120.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage("http://image.tmdb.org/t/p/w200/" + results[index].posterPath),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  width: 100.0,
                  child: Text(
                    results[index].title,
                    maxLines: 2,
                    style: TextStyle(
                      height: 1.4,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.0
                    ),
                  ),
                ),
                SizedBox(height: 5.0,),
                Row(
                  children: <Widget>[
                    Text(
                      results[index].voteAverage.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5.0,),
                    RatingBar(
                      itemSize: 8.0,
                      initialRating: results[index].voteAverage / 2,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(Icons.star, color: Color(0xFFF4C10F),
                      ),
                      onRatingUpdate: (rating){
                        print(rating);
                      },

                    )
                  ],
                )
              ],
            ),
          ),
        );
      }      
    );
  }

  Widget _renderGenresMoviesById(ItemMovieModel movies, BuildContext context){
    print(movies.results[0].posterPath);
    if(movies.results.length == 0){
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('NO MOVIES')
          ],
        ),
      );
    }
    else{
        return Container(
          height: 220,
          padding: EdgeInsets.only(left: 10),
          child: _renderItems(movies.results),
        );        
      }
  }

}