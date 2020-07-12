import 'package:movie_max/src/models/movieModels/itemMovieModel.dart';
import 'package:movie_max/src/models/genreModels/itemGenreModel.dart';
import 'package:movie_max/src/models/detailMovieModels/itemCast.dart';
import 'package:movie_max/src/providers/movieProvider.dart';
import 'package:movie_max/src/models/detailMovieModels/itemMovieDetail.dart';
import 'package:movie_max/src/models/videoModels/itemVideo.dart';

class MovieRepository{

  final movieProvider = MovieProvider();  

  Future<ItemMovieModel> fetchAllMoviesPlayingNow() => movieProvider.fetchMoviePlayingList();
  Future<ItemMovieModel> fetchAllMoviesPopular() => movieProvider.fetchMoviePopularList();
  Future<ItemGenreModel> fecthAllMovieGenres() => movieProvider.fetchMovieGenres();
  Future<ItemMovieModel> fetchAllMoviesByGenre(int id) => movieProvider.fetchMovieByGenre(id);
  Future<ItemMovieModel> fetchAllMovieSimilar(int id) => movieProvider.fetchMoviesSImilar(id);
  Future<ItemCast> fetchAllCastsMovie(int id) => movieProvider.fetchCasts(id);
  Future<ItemMovieDetail> fetchAllMovieDetails(int id) => movieProvider.fetchDetailMovie(id);
  Future<ItemVideo> fetchAllMovieVideo(int id) => movieProvider.fetchMovieVideos(id);

}