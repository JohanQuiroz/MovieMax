import 'package:movie_max/src/models/detailMovieModels/resultMovieDetail.dart';

class ItemMovieDetail{
  ResultMovieDetail movieDetail;
  
  ItemMovieDetail(this.movieDetail);


  ItemMovieDetail.fromJson(Map<String, dynamic> json)
  : movieDetail = ResultMovieDetail.fromJson(json);

}