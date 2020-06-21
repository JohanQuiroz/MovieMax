import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_max/src/pages/movies/PaginaPrincipal.dart';
import 'package:movie_max/src/pages/options/Opciones.dart';
import 'package:movie_max/src/pages/search/BuscadorPeliculas.dart';
import 'package:movie_max/src/pages/favorite/MiListaPeliculas.dart';



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
                PaginaPrincipal(),
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