
class ResultGenreModel {
    ResultGenreModel({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory ResultGenreModel.fromJson(Map<String, dynamic> json) => ResultGenreModel(
        id: json["id"],
        name: json["name"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}