import 'package:bloc/bloc.dart';
import 'package:movie_max/src/blocs/authenticationBloc/bloc.dart';
import 'package:movie_max/src/repository/userRepository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository _userRepository;

  AuthenticationBloc(this._userRepository);
  
  @override
  AuthenticationState get initialState => Uninitialized();


  //Se convierte de eventos a estados 
  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {

    if(event is AppStarted)
      yield* _mapAppStartedToState();    

    if(event is LoggedIn)
      yield* _mapLoggedInToState();    
      
    if(event is LoggedOut)
      yield* _mapLoggedOutToState();
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try{
      final isSignedIn = await _userRepository.isSignedIn();
      if(isSignedIn) 
        yield Authenticated(await _userRepository.getUser());
      else
        yield Unauthenticated();
    }catch(_){
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield Authenticated(await _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _userRepository.signOut();
  }

}