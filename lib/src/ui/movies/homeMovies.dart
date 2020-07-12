import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/repository/movieRepository.dart';
import 'package:movie_max/src/ui/movies/nowPlayingMovies.dart';
import 'package:movie_max/src/ui/movies/genres.dart';
import 'package:movie_max/src/ui/movies/popularMovies.dart';
import 'package:movie_max/src/blocs/movieBloc/popularMovieBloc/bloc.dart';
import 'package:movie_max/src/blocs/movieBloc/genreMovieBloc/bloc.dart';

class HomeMovies extends StatefulWidget {
  @override
  _HomeMoviesState createState() => _HomeMoviesState();
}

class _HomeMoviesState extends State<HomeMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
              child: Container(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  height: 35,
                ),              
              ),
            )                         
          ]  
        ),        
      ),
      body: ListView(
        children: <Widget>[
          NowPlayingMovies(), 
          SizedBox(height: 20,),               
          BlocProvider(
            create : (context) => GenreMovieBloc(movieRepository: MovieRepository()),
            child: Genres(),
          ),
          SizedBox(height: 20,),     
           BlocProvider(
            create : (context) => PopularMovieBloc(movieRepository: MovieRepository()),
            child: PopularMovies(),
          ),
          //Genres(),        
          
        ],
      ),

    );
  }
}