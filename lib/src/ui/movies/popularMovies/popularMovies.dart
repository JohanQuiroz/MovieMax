import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_max/src/models/movieModels/itemMovieModel.dart';
import 'package:movie_max/src/models/movieModels/resultMovieModel.dart';
import 'package:movie_max/src/blocs/movieBloc/popularMovieBloc/bloc.dart';

class PopularMovies extends StatefulWidget {
  @override
  _PopularMoviesState createState() => _PopularMoviesState();

}

class _PopularMoviesState extends State<PopularMovies> {
  
  PopularMovieBloc popularMovieBloc;
  ItemMovieModel itemMovie;

  @override
  void initState() {    
    super.initState();
    popularMovieBloc = BlocProvider.of<PopularMovieBloc>(context);
    popularMovieBloc.add(FetchPopularMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PopularMovieBloc, PopularMovieState>(
      listener: (context, state) {                                                           
        if(state is PopularMovieErrorState){
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(_renderError(state.message));                
        }            
      },  
      child: BlocBuilder<PopularMovieBloc, PopularMovieState>(            
        builder: (context, state){
          if(state is PopularMovieInitialState)
            return _renderLoading();
          else if(state is PopularMovieLoadingState)
            return _renderLoading();     
          else if (state is PopularMovieLoadedState){
            return _renderMovies(state.movies, context);
          }           
        },
      ),
    );
  }

/*
  Widget renderPeliculas(String titulo, String categoria){
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 220,
      child: Column(
        children: <Widget>[  
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 5)),
                Text(titulo, style: TextStyle(color: Colors.white, fontSize: 15)),
              ]
            ),
          ),              
          Container(
            height: 200,
            child: ListView(
              padding: EdgeInsets.all(3),
              scrollDirection: Axis.horizontal,                    
              children: renderContainers(categoria),
            ),
          )
        ],
      ),
    );
  }*/

  Widget _renderItems(List<ResultMovieModel> results){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: results.length,
      itemBuilder: (context, index){
        return Row(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 278.0,
                minWidth: MediaQuery.of(context).size.width * 0.40,
                maxHeight: 278.0,
                maxWidth: MediaQuery.of(context).size.width * 0.40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network("http://image.tmdb.org/t/p/w185/" + results[index].posterPath),
                  ),
                  SizedBox(height: 10,),
                  Text(results[index].title)
                ],  
              )          
            ),
            SizedBox(width: 20,),
          ],
            
        );
      }      
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

  Widget _renderMovies(ItemMovieModel movies, BuildContext context){
    print(movies.results[0].posterPath);
    return Container(      
      width: MediaQuery.of(context).size.width -20,
      height: 278,      
      child: _renderItems(movies.results),
    );
  }

}