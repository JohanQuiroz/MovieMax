import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class InicioSesion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          FadeInDown(
            child: Container(
              height: 280,            
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fondoIniciarSesion.png'),
                    fit: BoxFit.cover,
                ),
              ),
            ),
          ),         

          SizedBox(height: 10,),
          FadeInLeft(
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                'BIENVENIDO',
                style: TextStyle(                
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            ),
          ),
          SizedBox(height: 25,),
          FadeInRight(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.person), onPressed: () {}),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 4, right: 30),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Usuario'),
                    ),
                  )),
                ],
              ),
            ),
          ),
          FadeInRight(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.lock), onPressed: () {}),
                  Expanded(
                    child: Container(
                    margin: EdgeInsets.only(left: 4, right: 30),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Contraseña'),
                    ),
                  )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
                Pulse(
                    child: InkWell(
                    
                    onTap: (){
                      Navigator.pushNamed(context, 'MenuControllerBar');
                    },

                    child: Container(
                      height: 50,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        'Iniciar',
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                               
                Padding(                  
                    padding: const EdgeInsets.all(25.0),     

                    child : Column(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, 'RegistroCuenta');
                          },
                          child: Center(
                            child: FadeInUp(
                              child: RichText(
                                text: TextSpan(
                                  text: '¿No tienes una cuenta? ',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: ' Registrate',
                                      style: TextStyle(color: Colors.blue),
                                    )
                                  ]                                                                                                       
                                ),                                                                                                                                                           
                              ),
                            ),
                          ),
                        )
                      ],                    
                    )                               
                  ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
