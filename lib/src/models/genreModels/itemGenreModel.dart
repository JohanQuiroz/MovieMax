import 'package:movie_max/src/models/genreModels/resultGenreModel.dart';

class ItemGenreModel {
    ItemGenreModel({
        this.genres,
    });

    List<ResultGenreModel> genres;

    factory ItemGenreModel.fromJson(Map<String, dynamic> json) => ItemGenreModel(
        genres: List<ResultGenreModel>.from(json["genres"].map((x) => ResultGenreModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    };
}