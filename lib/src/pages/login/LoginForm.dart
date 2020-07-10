import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_max/src/blocs/authenticationBloc/authenticationBloc.dart';
import 'package:movie_max/src/blocs/authenticationBloc/authenticationEvent.dart';
import 'package:movie_max/src/blocs/loginBloc/bloc.dart';
import 'package:movie_max/src/repository/userRepository.dart';

class LoginForm extends StatefulWidget {

  final UserRepository _userRepository;

   LoginForm({Key key, @required UserRepository userRepository})
    :assert(userRepository!=null),
    _userRepository = userRepository,
    super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController =  TextEditingController();
  final TextEditingController _passwordController =  TextEditingController();
  LoginBloc _loginBloc;
  UserRepository get _userRepository => widget._userRepository;
  bool get isPopulated =>
    _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
  bool isLoginButtonEnabled(LoginState state){
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {    
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
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
    _loginBloc.add(
      EmailChanged(email: _emailController.text)
    );
  }

  void _onPasswordChanged(){
    _loginBloc.add(
      PasswordChanged(password: _passwordController.text)
    );
  }

  void _onFormSubmitted(){
    _loginBloc.add(
      LoginWithCredentialsPressed(email: _emailController.text, password: _passwordController.text)
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state){
        if(state.isFailure){
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Login Failure'),
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
                    Text('Logging In'),
                    CircularProgressIndicator(),
                  ],
                ),                
              )
            );
        }
        if(state.isSuccess){
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state){
          return Form(
              child: ListView(
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
                      padding: const EdgeInsets.only(left: 35, right: 50),                      
                      child: _renderTextFormEmail(state),                                            
                    ),
                  ),
                  FadeInRight(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30,left: 35, right: 50), 
                      child: _renderTextFormPassword(state),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: <Widget>[
                        Pulse(
                          child: _renderButtonStart(state),
                        ),  
                        SizedBox(height: 20,),
                        Pulse(
                          child: _renderButtonGoogleLogin(),
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
        },
      )
    );
  }

  Widget _renderTextFormEmail(LoginState state){
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

   Widget _renderTextFormPassword(LoginState state){
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

  Widget _renderButtonStart(LoginState state){
    return InkWell(                            
      onTap: isLoginButtonEnabled(state) ? _onFormSubmitted : null,
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
    );
  }

   Widget _renderButtonGoogleLogin(){
    return GoogleSignInButton(
      onPressed: (){
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Logging In'),
                CircularProgressIndicator(),
              ],
            ),                
          )
        );
        BlocProvider.of<LoginBloc>(context).add(
          LoginWithGooglePressed()
        );
      },
    );
  }
}