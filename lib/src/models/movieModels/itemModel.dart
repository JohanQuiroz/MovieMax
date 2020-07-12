import 'package:movie_max/src/models/movieModels/resultModel.dart';

class ItemModel {
    ItemModel({
        this.page,
        this.totalResults,
        this.totalPages,
        this.results,
    });

    int page;
    int totalResults;
    int totalPages;
    List<ResultModel> results;

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
        results: List<ResultModel>.from(json["results"].map((x) => ResultModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "total_results": totalResults,
        "total_pages": totalPages,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}