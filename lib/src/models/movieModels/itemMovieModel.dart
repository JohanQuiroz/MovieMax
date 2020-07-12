import 'package:movie_max/src/models/movieModels/resultMovieModel.dart';

class ItemMovieModel {
    ItemMovieModel({
        this.page,
        this.totalResults,
        this.totalPages,
        this.results,
    });

    int page;
    int totalResults;
    int totalPages;
    List<ResultMovieModel> results;

    factory ItemMovieModel.fromJson(Map<String, dynamic> json) => ItemMovieModel(
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
        results: List<ResultMovieModel>.from(json["results"].map((x) => ResultMovieModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "total_results": totalResults,
        "total_pages": totalPages,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}