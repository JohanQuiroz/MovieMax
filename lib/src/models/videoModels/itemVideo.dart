import 'package:movie_max/src/models/videoModels/resultVideo.dart';

class ItemVideo {
    ItemVideo({
        this.id,
        this.videos,
    });

    int id;
    List<ResultVideo> videos;

    factory ItemVideo.fromJson(Map<String, dynamic> json) => ItemVideo(
        id: json["id"],
        videos: List<ResultVideo>.from(json["results"].map((x) => ResultVideo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "results": List<dynamic>.from(videos.map((x) => x.toJson())),
    };
}