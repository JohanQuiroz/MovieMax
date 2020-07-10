import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_max/src/ui/search/BusquedaPersonalizadaDelegar.dart';

class BuscadorPeliculas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,         
        automaticallyImplyLeading: false,
        title: FadeInLeft(child: Text('Buscar')),
        centerTitle: true,
        actions: <Widget>[
          Pulse(
            infinite: true,
            child: IconButton(icon: Icon(Icons.search),color: Colors.amber, onPressed: () {            
              showSearch(              
                context: context, 
                delegate: BusquedaPersonalizadaDelegar()
              );
            }),
          ),
        ],
      ),      
    );
  }
}
