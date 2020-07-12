import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_max/src/blocs/movieBloc/movieVideoBloc/bloc.dart';
import 'package:movie_max/src/blocs/movieBloc/similarMovieBloc/bloc.dart';
import 'package:movie_max/src/models/movieModels/itemMovieModel.dart';
import 'package:movie_max/src/models/movieModels/resultMovieModel.dart';
import 'package:movie_max/src/repository/movieRepository.dart';
import 'package:movie_max/src/ui/movies/detailMovies/detailsMovie.dart';

class SimilarMovie extends StatefulWidget {

  final int id;

  SimilarMovie({Key key, @required this.id})
    :super(key:key);

  @override
  _SimilarMovieState createState() => _SimilarMovieState(id);
}

class _SimilarMovieState extends State<SimilarMovie> {
  final int id;
  SimilarMovieBloc similarMovieBloc;

  _SimilarMovieState(this.id);

   @override
  void initState() {    
    super.initState();
    similarMovieBloc = BlocProvider.of<SimilarMovieBloc>(context);
    similarMovieBloc.add(FetchSimilarMovieEvent(id: id));
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10, top: 20),
          child: Text(
            'SIMILAR MOVIES',
            style:  TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w500,
              fontSize: 12.0
            ),
          ),
        ),
        SizedBox(height: 5.0,),
        BlocListener<SimilarMovieBloc, SimilarMovieState>(
          listener: (context, state) {                                                           
            if(state is SimilarMovieErrorState){
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(_renderError(state.message));                
            }                           
          },  
          child: BlocBuilder<SimilarMovieBloc, SimilarMovieState>(            
            builder: (context, state){
              if(state is SimilarMovieInitialState)
                return _renderLoading();
              else if(state is SimilarMovieLoadingState)
                return _renderLoading();     
              else if (state is SimilarMovieLoadedState){
                return _renderMovieSimilarWidget(state.movies, context);
              }                                                                        
            },
          ),      
        ),
      ],
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
  

   Widget _renderMovieSimilarWidget(ItemMovieModel movies, BuildContext context){    
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
          height: 280,
          padding: EdgeInsets.only(left: 10),
          child: _renderItems(movies.results),
        );        
      }
  }
}