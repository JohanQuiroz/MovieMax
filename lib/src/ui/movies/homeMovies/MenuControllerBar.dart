import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_max/src/ui/movies/nowMovies/nowPlayingMovies.dart';
import 'package:movie_max/src/ui/movies/popularMovies/popularMovies.dart';
import 'package:movie_max/src/ui/movies/homeMovies/homeMovies.dart';
import 'package:movie_max/src/ui/options/Opciones.dart';
import 'package:movie_max/src/ui/search/BuscadorPeliculas.dart';
import 'package:movie_max/src/ui/favorite/MiListaPeliculas.dart';

class MenuControllerBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Theme(
        data: ThemeData(
          brightness: Brightness.dark
        ), 
        child: FadeInUp(
          child: Scaffold(
            bottomNavigationBar: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.home), text: 'Inicio',),
                Tab(icon: Icon(Icons.search), text: 'Buscar',),
                Tab(icon: Icon(Icons.star_border), text: 'Mi Lista',),
                Tab(icon: Icon(Icons.list), text: 'Mas',),                        
              ],
              labelColor: Colors.amber,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.amber,
            ),     

            body: TabBarView(
              children: <Widget>[
                HomeMovies(),
                BuscadorPeliculas(),
                MiListaPeliculas(),
                Opciones(),
              ],
            ),    
          ),
        ),
      ),

    );
  }
}