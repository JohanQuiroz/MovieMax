import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/models/genreModels/itemGenreModel.dart';
import 'package:movie_max/src/models/genreModels/resultGenreModel.dart';
import 'package:movie_max/src/models/movieModels/resultMovieModel.dart';
import 'package:movie_max/src/repository/movieRepository.dart';
import 'package:movie_max/src/ui/movies/genresMovies/genresMovies.dart';
import 'package:movie_max/src/blocs/movieBloc/genreMovieBloc/bloc.dart';


class GenresListMovies extends StatefulWidget {
  final List<ResultGenreModel> genres;
  
  GenresListMovies({Key key, @required this.genres})
    :super(key:key);

  @override
  _GenresListMoviesState createState() => _GenresListMoviesState(genres);
}

class _GenresListMoviesState extends State<GenresListMovies> with SingleTickerProviderStateMixin {
  final List<ResultGenreModel> genres;
  TabController _tabController;
  _GenresListMoviesState(this.genres);

  @override
  void initState() {    
    super.initState();
    _tabController = TabController(vsync: this, length: genres.length );
  }

  @override
  void dispose() {    
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 307.0,
      child: DefaultTabController(        
        length: genres.length, 
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: PreferredSize(
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Color(0xFFF4C10F),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3.0,
                unselectedLabelColor: Color(0xFF5A606B),
                labelColor: Colors.white,
                isScrollable: true,
                tabs : genres.map((ResultGenreModel genre) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 5.0, top: 10.0),
                    child: Text(genre.name.toUpperCase(), style : TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold
                    )),                    
                  );
                }).toList(),
              ),
            ), 
            preferredSize: Size.fromHeight(50.0),
          ),
          body: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: genres.map((ResultGenreModel genre){
              return BlocProvider(
                create : (context) => GenreMovieBloc(movieRepository: MovieRepository()),
                child: GenresMovies(genreId: genre.id),
              );   
              //return GenresMovies(genreId: genre.id);
            }).toList(),
          ),
        )
      ),
    );
  }
}