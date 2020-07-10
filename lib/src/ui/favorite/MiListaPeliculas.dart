
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_max/src/models/GestorPeliculas.dart';


class MiListaPeliculas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,    
        centerTitle: true,
        title: FadeInDown(
          child: Text(
            'Mi Lista de Peliculas',
            style: TextStyle(
              color: Colors.white
            ),),
        ),    
      ),
      body: Container(
        child: FadeInRight(child: _lista()),
      ),

    );
  }


  Widget _lista(){
    return FutureBuilder(
      future: gestorPeliculas.cargarMiListaPeliculas(),
      initialData: [],      
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _peliculas(snapshot.data), 
        );
      },
    );
  }

  List<Widget> _peliculas(List<dynamic> data){
    final List<Widget> peliculas = [];     
    peliculas.add(SizedBox(height: 20,));
    data.forEach((p) {
      final temp = ListTile(
        title: Text(p.nombre),
        leading: Image(
          image: AssetImage('assets/images/'+p.ruta)        
        ),        
        trailing: Icon(Icons.more_horiz, color: Colors.amber,),
      );      
      
      peliculas..add(temp)              
               ..add(Divider());
    });
    return peliculas;
  }
}