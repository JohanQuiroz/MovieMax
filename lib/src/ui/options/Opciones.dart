import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/authenticationBloc/authenticationBloc.dart';
import 'package:movie_max/src/blocs/authenticationBloc/authenticationEvent.dart';

class Opciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,      
      body: ListView(
        padding: EdgeInsets.all(20),     
        children: <Widget>[         
          SizedBox(height: 30,),
          Row(          
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeInRight(                  
                    child: Image(
                      image: AssetImage('assets/images/profile.png')
                    ),
                  ),
                  FadeInUp(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text('Usuario'),
                    ),
                  )                  
                ],
              )              
            ],
          ),  
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeInRight(child: Icon(Icons.edit)),              
              FadeInRight(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Editar Perfil')
                ),
              )
            ],
          ),     
          SizedBox(height: 50,),
          FadeInUp(
            child: Container(            
              width: 200,
              height: 300,
              color: Colors.white10,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 5,),
                  FadeInLeft( child: renderOpcion('Notificaciones')),                
                  SizedBox(height: 5,),
                  FadeInRight(child: renderOpcion('Ayuda')),
                  SizedBox(height: 5,),                
                  FadeInLeft(child: renderOpcion('Acerca de')),
                  SizedBox(height: 5,),
                  FadeInRight(child: renderCerrarSesion(context)),

                ],
              ),
            ),
          ),
                               
        ],
      )
      
    );
  }

  Widget renderOpcion(String texto){
    return  ListTile(
      title: Text(texto),                  
    );
  }

  Widget renderCerrarSesion(BuildContext context){
    return  ListTile(
      title: Text('Cerrar Sesión'),    
      onTap: (){
        BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
      },              
    );
  }
}