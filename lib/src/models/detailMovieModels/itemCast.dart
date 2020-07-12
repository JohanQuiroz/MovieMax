import 'package:movie_max/src/models/detailMovieModels/resultCast.dart';

class ItemCast {
    ItemCast({
        this.id,
        this.cast,        
    });

    int id;
    List<ResultCast> cast;


    factory ItemCast.fromJson(Map<String, dynamic> json) => ItemCast(
        id: json["id"],
        cast: List<ResultCast>.from(json["cast"].map((x) => ResultCast.fromJson(x))),        
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),        
    };
}