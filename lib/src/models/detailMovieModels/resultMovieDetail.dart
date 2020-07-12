import 'package:movie_max/src/models/genreModels/resultGenreModel.dart';

class ResultMovieDetail{
  int id;
  bool adult;
  int budget;
  List<ResultGenreModel> genres;
  String releaseDate;
  int runtime;


  ResultMovieDetail(
    this.id,
    this.adult,
    this.budget,
    this.genres,
    this.releaseDate,
    this.runtime
  );

  ResultMovieDetail.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    adult = json["adult"],
    budget = json["budget"],
    genres = (json["genres"] as List).map((i) => new ResultGenreModel.fromJson(i)).toList(),
    releaseDate = json["release_date"],
    runtime = json["runtime"];
  


}