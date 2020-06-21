import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class LoginInicio extends StatelessWidget {
              
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/moviemaxFondoOriginal.png',
            fit: BoxFit.cover,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 400,),
                ZoomIn(
                  delay: Duration(milliseconds: 1500),
                  child: renderBoton(context, Colors.white70, Colors.black, 'Iniciar Sesión', 'InicioSesion')
                ),
                SizedBox( height: 50,),
                ZoomIn(
                  delay: Duration(milliseconds: 1500),
                  child: renderBoton(context, Colors.amber, Colors.black, 'Registrarse', 'RegistroCuenta')
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget renderBoton(BuildContext context,  Color colorFondo, Color coloLetra, String texto, String ruta) {
    return InkWell(

      onTap: (){
        Navigator.pushNamed(context, ruta);
      },

      child: Container(
        height: 63,
        width: 250,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorFondo,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          texto,
          style: TextStyle(
            color: coloLetra,
            fontSize: 20, 
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
