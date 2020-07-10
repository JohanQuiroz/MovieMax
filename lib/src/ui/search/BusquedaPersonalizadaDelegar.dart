import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_max/src/models/GestorPeliculas.dart';
import 'package:movie_max/src/models/Pelicula.dart';


class BusquedaPersonalizadaDelegar extends SearchDelegate<String> {
  Pelicula pelicula;

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final TextStyle estiloTitulo =
        TextStyle(fontWeight: FontWeight.normal, color: Colors.white);
    final TextStyle estiloTituloInicio =
        TextStyle(fontWeight: FontWeight.normal, color: Colors.white54);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
        primaryColor: Colors.black87,
        primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.amber),
        primaryColorBrightness: Brightness.dark,
        backgroundColor: Colors.black87,
        textTheme: theme.textTheme.copyWith(headline6: estiloTitulo),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: estiloTituloInicio,
        ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            FadeInLeft(
              child: Image(image: AssetImage('assets/images/' + pelicula?.ruta))
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeInRight(
                  child: Text(
                    pelicula.nombre,
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20

                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: FadeInUp(
                  child: Text(
                    pelicula.descripcion,
                    style: TextStyle(
                      color: Colors.white
                    ),                    
                  textAlign: TextAlign.justify,
                ),
              ),      
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Pelicula> listaSugerencias = query.isEmpty
        ? gestorPeliculas.peliculasRecientes
        : gestorPeliculas.peliculas
            .where((p) => p.nombre.startsWith(query))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.location_city),
        title: Text(listaSugerencias[index].nombre),
        onTap: () {
          pelicula = new Pelicula(
              listaSugerencias[index].nombre,
              listaSugerencias[index].descripcion,
              listaSugerencias[index].ruta);
          showResults(context);
        },
      ),
      itemCount: listaSugerencias.length,
    );
  }
}
