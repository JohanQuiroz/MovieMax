class ResultModel {    

    double popularity;
    String voteCount;
    bool video;
    String posterPath;
    int id;
    bool adult;
    String backdropPath;        
    List<int> genreIds = [];
    String title;
    var voteAverage;
    String overview;
    String releaseDate;

    ResultModel({
        this.popularity,
        this.voteCount,
        this.video,
        this.posterPath,
        this.id,
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.title,
        this.voteAverage,
        this.overview,
        this.releaseDate,
    });

/*
    ResultModel(result){
      popularity: result["popularity"].toDouble();
      voteCount: result["vote_count"].toString();
      video: result["video"];
      posterPath: result["poster_path"];
      id: result["id"];
      adult: result["adult"];
      backdropPath: result["backdrop_path"].toString();        
      originalTitle: result["original_title"];
      genreIds: List<int>.from(result["genre_ids"].map((x) => x));
      title: result["title"].toString();
      voteAverage: result["vote_average"].toDouble();
      overview: result["overview"];
      releaseDate: result["release_date"].toString();
    }
*/

    List<int> get getGenreIds => genreIds;
    String get getReleaseDate => releaseDate;
    String get getOverview => overview;
    String get getBackdropPath => backdropPath;
    String get getPosterPath => posterPath;
    String get getTitle => title;
    String get getVoteAvarage => voteAverage;
    String get getVoteCount => voteCount;
    double get getPopularity => popularity;
    bool get getIsAdult => adult;
    bool get getIsVideo => video;
    int get getId => id;

    factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"].toString(),
        video: json["video"],
        posterPath: json["poster_path"],
        id: json["id"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"].toString(),                        
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: json["release_date"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "popularity": popularity,
        "vote_count": voteCount,
        "video": video,
        "poster_path": posterPath,
        "id": id,
        "adult": adult,
        "backdrop_path": backdropPath,                
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "title": title,
        "vote_average": voteAverage,
        "overview": overview,
        "release_date": releaseDate,
    };
}
