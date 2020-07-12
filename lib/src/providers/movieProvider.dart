import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:movie_max/src/models/movieModels/itemMovieModel.dart';
import 'package:movie_max/src/models/genreModels/itemGenreModel.dart';
import 'package:movie_max/src/models/detailMovieModels/itemMovieDetail.dart';
import 'package:movie_max/src/models/detailMovieModels/itemCast.dart';
import 'package:movie_max/src/models/videoModels/itemVideo.dart';

class MovieProvider{

  Client client = Client();
  final apiKey = "8b006f9cf799b1a20f184fe1ba8f8305";
  final baseUrl = "http://api.themoviedb.org/3";

  Future<ItemMovieModel> fetchMoviePlayingList() async {
    print("entered");
    final response =  await client.get("$baseUrl/movie/now_playing?api_key=$apiKey");    
    if(response.statusCode == 200){
      return ItemMovieModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to load post');
    }
  }

  Future<ItemMovieModel> fetchMoviePopularList() async {
    print("entered Popular");
    final response =  await client.get("$baseUrl/movie/top_rated?api_key=$apiKey");    
    if(response.statusCode == 200){
      return ItemMovieModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to load post');
    }
  }

  Future<ItemGenreModel> fetchMovieGenres() async {
    print("entered Popular");
    final response =  await client.get("$baseUrl/genre/movie/list?api_key=$apiKey");        
    if(response.statusCode == 200){
      return ItemGenreModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to load post');
    }
  }

  Future<ItemMovieModel> fetchMovieByGenre(int id) async {
    print("entered Popular");    
    final response =  await client.get("$baseUrl/discover/movie?api_key=$apiKey&page=1&with_genres=$id");    
    print(json.decode(response.body));
    if(response.statusCode == 200){
      return ItemMovieModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to load post');
    }
  }

  Future<ItemMovieDetail> fetchDetailMovie(int id) async {
    print("entered Popular");    
    final response =  await client.get("$baseUrl/movie/$id?api_key=$apiKey");    
    print(json.decode(response.body));
    if(response.statusCode == 200){
      return ItemMovieDetail.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to load post');
    }
  }

  Future<ItemCast> fetchCasts(int id) async {
    print("entered Popular");    
    final response =  await client.get("$baseUrl/movie/$id/credits?api_key=$apiKey");    
    print(json.decode(response.body));
    if(response.statusCode == 200){
      return ItemCast.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to load post');
    }
  }


  Future<ItemMovieModel> fetchMoviesSImilar(int id) async {
    print("entered Popular");    
    final response =  await client.get("$baseUrl/movie/$id/similar?api_key=$apiKey");    
    print(json.decode(response.body));
    if(response.statusCode == 200){
      return ItemMovieModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to load post');
    }
  }

  Future<ItemVideo> fetchMovieVideos(int id) async {
    print("entered Popular");    
    final response =  await client.get("$baseUrl/movie/$id/videos?api_key=$apiKey");    
    print(json.decode(response.body));
    if(response.statusCode == 200){
      return ItemVideo.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to load post');
    }
  }

}