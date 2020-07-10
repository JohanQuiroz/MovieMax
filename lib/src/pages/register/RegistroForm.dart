import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/authenticationBloc/authenticationBloc.dart';
import 'package:movie_max/src/blocs/authenticationBloc/authenticationEvent.dart';
import 'package:movie_max/src/blocs/registerBloc/bloc.dart';
import 'package:movie_max/src/repository/userRepository.dart';

class RegistroForm extends StatefulWidget {

  final UserRepository _userRepository;

   RegistroForm({Key key, @required UserRepository userRepository})
    :assert(userRepository!=null),
    _userRepository = userRepository,
    super(key: key);
  @override
  _RegistroFormState createState() => _RegistroFormState();
}

class _RegistroFormState extends State<RegistroForm> {
  final TextEditingController _emailController =  TextEditingController();
  final TextEditingController _passwordController =  TextEditingController();

  RegisterBloc _registerBloc;
  
  bool get isPopulated =>
    _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state){
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {    
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged(){
    _registerBloc.add(
      EmailChanged(email: _emailController.text)
    );
  }

  void _onPasswordChanged(){
    _registerBloc.add(
      PasswordChanged(password: _passwordController.text)
    );
  }

  void _onFormSubmitted(){
    _registerBloc.add(
      Submitted(email: _emailController.text, password: _passwordController.text)
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state){
        if(state.isFailure){
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Register Failure'),
                    Icon(Icons.error)
                  ],
                ),
                backgroundColor: Colors.red,
              )
            );
        }
        if(state.isSubmitting){
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Registering'),
                    CircularProgressIndicator(),
                  ],
                ),                
              )
            );
        }
        if(state.isSuccess){
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state){
          return Form(
            child: ListView(
              children: <Widget>[
                FadeInUp(            
                  child: Container(
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
                            FadeInRight(                      
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ), 
                                onPressed: (){
                                  Navigator.pop(context);
                                }
                              ),
                            ),
                            FadeInRight(
                              child: Text(
                                'Atras',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,                            
                                  fontSize: 18
                                ),
                              ),
                            )
                          ],
                        ),                                                                                        
                      ],
                    ),
                    
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                FadeInUp(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      'REGISTRO',
                      style: TextStyle(                
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),

                FadeInUp(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.person), onPressed: () {}),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(left: 4, right: 30),
                          child: TextField(
                            decoration: InputDecoration(hintText: 'Nombres'),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
                FadeInUp(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35, right: 50),  
                    child : _renderTextFormEmail(state),
                  ),
                ),
                SizedBox(height: 20,),
                FadeInLeft(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35, right: 50),  
                    child: _renderTextFormPassword(state),
                  ),
                ),

                FadeInRight(
                  child: Padding(
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
                ),

                Pulse(                      
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35, right: 50), 
                    child: _renderButtonRegister(state),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  

  Widget _renderTextFormEmail(RegisterState state){
    return TextFormField(
      controller: _emailController,      
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Email',                
      ),
      keyboardType: TextInputType.emailAddress,
      autovalidate: true,
      autocorrect: false,
      validator: (_){
        return !state.isEmailValid ? 'Invalid Email' : null;
      },
    );
  }

   Widget _renderTextFormPassword(RegisterState state){
    return TextFormField(
      controller: _passwordController,      
      decoration: InputDecoration(
        icon: Icon(Icons.lock),                
        labelText: 'Password',                
      ),
      obscureText: true,
      autovalidate: true,
      autocorrect: false,
      validator: (_){
        return !state.isPasswordValid ? 'Invalid Password' : null;
      },
    );
  }

  Widget _renderButtonRegister(RegisterState state){
    return InkWell(                            
      onTap: isRegisterButtonEnabled(state) ? _onFormSubmitted : null,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: 50,
        width: 180,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          'Register',
          style:
              TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

}