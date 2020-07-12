import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/movieBloc/castMovieBloc/bloc.dart';
import 'package:movie_max/src/models/detailMovieModels/itemCast.dart';
import 'package:movie_max/src/models/detailMovieModels/resultCast.dart';

class CastsMovie extends StatefulWidget {
  final int id;

  CastsMovie({Key key, @required this.id})
    :super(key:key);
  @override
  _CastsMovieState createState() => _CastsMovieState(id);
}

class _CastsMovieState extends State<CastsMovie> {
  final int id;
  CastMovieBloc castMovieBloc;
  _CastsMovieState(this.id);

  @override
  void initState() {    
    super.initState();
    castMovieBloc = BlocProvider.of<CastMovieBloc>(context);
    castMovieBloc.add(FetchCastMovieEvent(id: id));
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            'CASTS',
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w500,
              fontSize: 12.0
            ),
          ),
        ),
        SizedBox(height: 5.0,),
        BlocListener<CastMovieBloc, CastMovieState>(
          listener: (context, state) {                                                           
            if(state is CastMovieErrorState){
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(_renderError(state.message));                
            }                           
          },  
          child: BlocBuilder<CastMovieBloc, CastMovieState>(            
            builder: (context, state){
              if(state is CastMovieInitialState)
                return _renderLoading();
              else if(state is CastMovieLoadingState)
                return _renderLoading();     
              else if (state is CastMovieLoadedState){
                return _renderCastsWidget(state.data);
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

  Widget _renderCastsWidget(ItemCast data){    
    return Container(
      height: 140.0,
      padding: EdgeInsets.only(left: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.cast.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(top: 10.0, right: 8.0),
            width: 100.0,
            child: GestureDetector(
              onTap: (){},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "http://image.tmdb.org/t/p/w300/"+data.cast[index].profilePath,
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    data.cast[index].name,
                    maxLines: 2,
                    style: TextStyle(
                      height: 1.4,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 9.0
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    data.cast[index].character,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 7.0
                    ),
                  )

                ],
              ),
            ),
          );
        }          
      ),      
    );
  }

}