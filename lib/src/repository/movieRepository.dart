import 'package:movie_max/src/models/movieModels/itemModel.dart';
import 'package:movie_max/src/models/genreModels/itemGenreModel.dart';
import 'package:movie_max/src/providers/movieProvider.dart';

class MovieRepository{

  final movieProvider = MovieProvider();  

  Future<ItemModel> fetchAllMoviesPlayingNow() => movieProvider.fetchMoviePlayingList();
  Future<ItemModel> fetchAllMoviesPopular() => movieProvider.fetchMoviePopularList();
  Future<ItemGenreModel> fecthAllMovieGenres() => movieProvider.fetchMovieGenres();
  Future<ItemModel> fetchAllMoviesByGenre(int id) => movieProvider.fetchMovieByGenre(id);

}