import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/movieBloc/nowMovieBloc/bloc.dart';
import 'package:movie_max/src/models/movieModels/itemMovieModel.dart';
import 'package:movie_max/src/models/movieModels/resultMovieModel.dart';
import 'package:page_indicator/page_indicator.dart';

class NowPlayingMovies extends StatefulWidget {
  @override
  _NowPlayingMoviesState createState() => _NowPlayingMoviesState();

}

class _NowPlayingMoviesState extends State<NowPlayingMovies> {
  
  NowMovieBloc movieBloc;  

  @override
  void initState() {    
    super.initState();
    movieBloc = BlocProvider.of<NowMovieBloc>(context);
    movieBloc.add(FetchNowMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        //padding: EdgeInsets.all(10),
        child: BlocListener<NowMovieBloc, NowMovieState>(
          listener: (context, state) {                                                           
            if(state is NowMovieErrorState){
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(_renderError(state.message));                
            }            
          },  

          child: BlocBuilder<NowMovieBloc, NowMovieState>(            
            builder: (context, state){
              if(state is NowMovieInitialState)
                return _renderLoading();
              else if(state is NowMovieLoadingState)
                return _renderLoading();     
              else if (state is NowMovieLoadedState){
                return _renderMovies(state.movies, context);
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
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: results.take(5).length,
      itemBuilder: (context, index){
        return Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: NetworkImage("http://image.tmdb.org/t/p/original/" + results[index].backdropPath)
                )
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(1.0),
                    Colors.black.withOpacity(0.0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [ 0.0, 0.9]                
                ),
              ),
            ),
            Positioned(
              top: 0, bottom: 0, right: 0, left: 0,              
              child: Icon(
                Icons.play_circle_outline,
                color: Color(0xFFF4C10F),
                size: 40.0,
              )
            ),
            Positioned(
              bottom: 30.0,
              child: Container(
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0
                ),
                width: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      results[index].title,
                      style: TextStyle(
                        height: 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0
                      ),)
                  ],
                )
              ),              
            ),
          ],
        );
      } ,
    ); 
  }

  Widget _renderMovies(ItemMovieModel movies, BuildContext context){
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
          child: PageIndicatorContainer(
            align: IndicatorAlign.bottom,
            indicatorSpace: 8.0,
            padding: EdgeInsets.all(5.0),
            indicatorColor: Color(0xFF5A606B),
            indicatorSelectorColor: Color(0xFFF4C10F),            
            child: _renderItems(movies.results),
            length: movies.results.take(5).length
          ),
        );        
      }
  }

}