import 'package:flutter/material.dart';

class RegistroCuenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: ListView(
        children: <Widget>[
          Container(
            height: 190,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fondoRegistrarse.png'),
                fit: BoxFit.cover,
              ),
            ),                              
            child: Stack(                                              
              children: <Widget>[                
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ), 
                      onPressed: (){
                        Navigator.pop(context);
                      }
                    ),
                    Text(
                      'Atras',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,                            
                        fontSize: 18
                      ),
                    )
                  ],
                ),                                                                                        
              ],
            ),
            
          ),

          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              'REGISTRO',
              style: TextStyle(                
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
          ),

          Padding(
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
          Padding(
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

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.email), onPressed: () {}),
                Expanded(
                  child: Container(
                  margin: EdgeInsets.only(left: 4, right: 30),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Correo'),
                  ),
                )),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: <Widget>[
                Radio(value: null, groupValue: null, onChanged: null),
                RichText(
                  text: TextSpan(
                    text: 'Acepto los ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Terminos y condiciones',
                        style: TextStyle(color: Colors.blue),                        
                      )
                    ]
                  )
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {                    
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
                      'Registrar',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),               
              ],
            ),
          ),
        ],
      ),
    );
  }
}