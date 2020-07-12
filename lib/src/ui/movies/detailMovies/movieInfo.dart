import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/movieBloc/movieDetailBloc/bloc.dart';
import 'package:movie_max/src/models/detailMovieModels/itemMovieDetail.dart';

class MovieInfo extends StatefulWidget {
  final int id;

  MovieInfo({Key key, @required this.id})
    :super(key:key);
  @override
  _MovieInfoState createState() => _MovieInfoState(id);
}

class _MovieInfoState extends State<MovieInfo> {
  final int id;
  MovieDetailBloc movieDetailBloc;

  _MovieInfoState(this.id);

  @override
  void initState() {    
    super.initState();
    movieDetailBloc = BlocProvider.of<MovieDetailBloc>(context);
    movieDetailBloc.add(FetchMovieDetailEvent(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieDetailBloc, MovieDetailState>(
      listener: (context, state) {                                                           
        if(state is MovieDetailErrorState){
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(_renderError(state.message));                
        }                           
      },  
      child: BlocBuilder<MovieDetailBloc, MovieDetailState>(            
        builder: (context, state){
          if(state is MovieDetailInitialState)
            return _renderLoading();
          else if(state is MovieDetailLoadingState)
            return _renderLoading();     
          else if (state is MovieDetailLoadedState){
            return _renderInfoMovieWidget(state.movieDetail, context);
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

  Widget _renderInfoMovieWidget(ItemMovieDetail data, BuildContext context ){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'BUDGET',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    data.movieDetail.budget.toString() + "\$",
                    style: TextStyle(
                      color: Color(0xFFF4C10F),
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),                    
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'DURATION',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    data.movieDetail.runtime.toString() + "min",
                    style: TextStyle(
                      color: Color(0xFFF4C10F),
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'RELEASE DATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    data.movieDetail.releaseDate,
                    style: TextStyle(
                      color: Color(0xFFF4C10F),
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              )
              
            ],
          ),
        ),
        SizedBox(height: 20.0,),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'GENRES',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 30.0,
                padding: EdgeInsets.only(right: 10, left: 10, top: 5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.movieDetail.genres.length,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(width: 1, color: Colors.white),                    
                        ),
                        child: Text(
                          data.movieDetail.genres[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 9.0
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}