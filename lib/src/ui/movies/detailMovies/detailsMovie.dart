import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_max/src/blocs/movieBloc/similarMovieBloc/bloc.dart';
import 'package:movie_max/src/models/movieModels/resultMovieModel.dart';
import 'package:movie_max/src/models/videoModels/itemVideo.dart';
import 'package:movie_max/src/ui/movies/videoMovies/videoPlayer.dart';
import 'package:sliver_fab/sliver_fab.dart';
import 'package:movie_max/src/blocs/movieBloc/movieVideoBloc/bloc.dart';
import 'package:movie_max/src/blocs/movieBloc/movieDetailBloc/bloc.dart';
import 'package:movie_max/src/repository/movieRepository.dart';
import 'package:movie_max/src/ui/movies/detailMovies/movieInfo.dart';
import 'package:movie_max/src/ui/movies/detailMovies/castsMovie.dart';
import 'package:movie_max/src/ui/movies/detailMovies/similarMovies.dart';
import 'package:movie_max/src/blocs/movieBloc/castMovieBloc/bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsMovie extends StatefulWidget {
  final ResultMovieModel resultMovie;

  DetailsMovie({Key key, @required this.resultMovie})
    :super(key:key);

  @override
  _DetailMoviesState createState() => _DetailMoviesState(resultMovie);
}

class _DetailMoviesState extends State<DetailsMovie> {
  final ResultMovieModel resultMovie;
  MovieVideoBloc movieVideoBloc;

  _DetailMoviesState(this.resultMovie);

  @override
  void initState() {    
    super.initState();
    movieVideoBloc = BlocProvider.of<MovieVideoBloc>(context);
    movieVideoBloc.add(FetchMovieVideoEvent(id: resultMovie.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context){
          return SliverFab(
            floatingPosition: FloatingPosition(right: 20.0),        
            floatingWidget: BlocListener<MovieVideoBloc, MovieVideoState>(
              listener: (context, state) {                                                           
                if(state is MovieVideoErrorState){
                  Scaffold.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(_renderError(state.message));                
                }                           
              },  
              child: BlocBuilder<MovieVideoBloc, MovieVideoState>(            
                builder: (context, state){
                  if(state is MovieVideoInitialState)
                    return _renderLoading();
                  else if(state is MovieVideoLoadingState)
                    return _renderLoading();     
                  else if (state is MovieVideoLoadedState){
                    return _renderVideoWidget(state.data, context);
                  }                                                                        
                },
              ),      
            ),   
            expandedHeight: 200.0,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: 200.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    resultMovie.title.length > 40
                    ? resultMovie.title.substring(0,37) + "..."
                    : resultMovie.title,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  background: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: NetworkImage(
                              "http://image.tmdb.org/t/p/original/" + resultMovie.backdropPath
                            )
                          )                          
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5)
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(                          
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.black.withOpacity(0.0),
                            ]
                          )
                        ),
                      )
                    ],
                  ),
                ),                
              ),       
              SliverPadding(
                padding: EdgeInsets.all(0.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              resultMovie.voteAverage.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 15.0,),
                            RatingBar(
                              itemSize: 10.0,
                              initialRating: resultMovie.voteAverage / 2,
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
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          'OVERVIEW',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          resultMovie.overview,
                          style: TextStyle(
                            color: Colors.white,                            
                            fontSize: 12.0,
                            height: 1.5
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      BlocProvider(
                        create : (context) => MovieDetailBloc(movieRepository: MovieRepository()),
                        child: MovieInfo(id: resultMovie.id,),
                      ),
                      SizedBox(height: 10.0,),
                      BlocProvider(
                        create : (context) => CastMovieBloc(movieRepository: MovieRepository()),
                        child: CastsMovie(id: resultMovie.id,),
                      ),
                      SizedBox(height: 10.0,),
                      BlocProvider(
                        create : (context) => SimilarMovieBloc(movieRepository: MovieRepository()),
                        child: SimilarMovie(id: resultMovie.id,),
                      ),
                      SizedBox(height: 10.0,),
                    ]
                  )
                ),
              ),       
            ],       
          );
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

  Widget _renderVideoWidget(ItemVideo data, BuildContext context ){
    return FloatingActionButton(
      backgroundColor: Color(0xFFF4C10F),
      child: Icon(Icons.play_arrow),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => VideoPlayer(
            controller: YoutubePlayerController(
              initialVideoId: data.videos[0].key,
              flags: YoutubePlayerFlags(
                forceHD: true,
                autoPlay: true
              )
            )
          ),
        ));
      },
    );
  }
}