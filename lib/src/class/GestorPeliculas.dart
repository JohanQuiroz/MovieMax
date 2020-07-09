import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:movie_max/src/class/Pelicula.dart';

class _GestorPeliculas {

  List<Pelicula> peliculas  = [];
  List<Pelicula> peliculasRecientes = [];
  
  _GestorPeliculas() {
    cargarTodasLasPeliculas();
    cargarPeliculasRecientes();

  }

  Future<List<Pelicula>> cargarTodasLasPeliculas() async {
    var rpta = await rootBundle.loadString('assets/data/peliculas.json');
    var jsonData = json.decode(rpta);
    for(var p in jsonData){
      Pelicula pelicula = new Pelicula( p['nombre'], ' ',  p['ruta']);
      peliculas.add(pelicula);
    }    
    return peliculas;
  }

  Future<List<Pelicula>> cargarPeliculasRecientes() async {
    var rpta = await rootBundle.loadString('assets/data/busquedasrecientes.json');
    var jsonData = json.decode(rpta);
    for(var p in jsonData){
      Pelicula pelicula = new Pelicula( p['nombre'], p['descripcion'],  p['ruta']);
      peliculasRecientes.add(pelicula);
    }    
    return peliculasRecientes;
  }

  Future<List<Pelicula>> cargarMiListaPeliculas() async {
    List<Pelicula> miListaPeliculas = [];
    var rpta = await rootBundle.loadString('assets/data/milistadepeliculas.json');
    var jsonData = json.decode(rpta);
    for(var p in jsonData){
      Pelicula pelicula = new Pelicula( p['nombre'], ' ',  p['ruta']);
      miListaPeliculas.add(pelicula);
    }        
    return miListaPeliculas;
  }
}

final gestorPeliculas = new _GestorPeliculas();