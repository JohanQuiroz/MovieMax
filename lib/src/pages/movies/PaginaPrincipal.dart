import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();

}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
              child: Container(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  height: 35,
                ),              
              ),
            )                         
          ]  
        ),        
      ),

      body: ListView(
        children: <Widget>[
          SizedBox(height: 20,),
          FadeInRight(
            child: renderPeliculas('Tendencia', 'peliculas_tendencia', )
          ),
          SizedBox(height: 20,),
          FadeInLeft(
            child : renderPeliculas('Accion', 'peliculas_accion'),
          ),          
          SizedBox(height: 20,),
          FadeInRight(
            child: renderPeliculas('Comedia', 'peliculas_comedia'),
          ),          
          SizedBox(height: 20,),
          FadeInLeft(
            child: renderPeliculas('Terror', 'peliculas_terror'),
          ),                    
        ],
        ),            
    );
  }

  Widget renderPeliculas(String titulo, String categoria){
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 220,
      child: Column(
        children: <Widget>[  
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 5)),
                Text(titulo, style: TextStyle(color: Colors.white, fontSize: 15)),
              ]
            ),
          ),              
          Container(
            height: 200,
            child: ListView(
              padding: EdgeInsets.all(3),
              scrollDirection: Axis.horizontal,                    
              children: renderContainers(categoria),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> renderContainers(String categoria){
    List<Widget> listaPeliculas = [];

    for(int i=1; i<=15; i++){
      listaPeliculas.add(Container(
        child: Image(
          image: AssetImage('assets/images/'+categoria+'/' +i.toString() + '.png' ),
          fit: BoxFit.cover,
        ),
        height: 200,
        width: 130,        
      )
      );
      listaPeliculas.add(SizedBox(width: 10,));
    }    

    return listaPeliculas;
  }

}