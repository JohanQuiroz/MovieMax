import 'package:flutter/cupertino.dart';

class RegisterState{

  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid;

  //Constructor
   RegisterState({
     @required this.isEmailValid,
     @required this.isPasswordValid,
     @required this.isSubmitting,
     @required this.isSuccess,
     @required this.isFailure
   });

  //Se crea 4 estados
  // -empty
  factory RegisterState.empty(){
    return RegisterState(
      isEmailValid: true, 
      isPasswordValid: true, 
      isSubmitting: false, 
      isSuccess: false, 
      isFailure: false
    );
  }
  
  // -loading
  factory RegisterState.loading(){
    return RegisterState(
      isEmailValid: true, 
      isPasswordValid: true, 
      isSubmitting: true, 
      isSuccess: false, 
      isFailure: false
    );
  }

  // -failure

  factory RegisterState.failure(){
    return RegisterState(
      isEmailValid: true, 
      isPasswordValid: true, 
      isSubmitting: false, 
      isSuccess: false, 
      isFailure: true
    );
  }

  // -success
  factory RegisterState.success(){
    return RegisterState(
      isEmailValid: true, 
      isPasswordValid: true, 
      isSubmitting: false, 
      isSuccess: true, 
      isFailure: false
    );
  }


  //Funciones adicionales

  RegisterState copyWith({
    bool isEmailValid,
    bool isPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }){
    return RegisterState(
      isEmailValid: isEmailValid ?? this.isEmailValid , 
      isPasswordValid: isPasswordValid ?? this.isPasswordValid, 
      isSubmitting: isSubmitting ?? this.isSubmitting, 
      isSuccess: isSuccess ?? this.isSuccess, 
      isFailure: isFailure ?? this.isFailure
    );
  }

  RegisterState update({
    bool isEmailValid,
    bool isPasswordValid
  }){
    return copyWith(
      isEmailValid: isEmailValid, 
      isPasswordValid: isPasswordValid, 
      isSubmitting: false, 
      isSuccess: false, 
      isFailure: false
    );
  }


  @override
  String toString() {    
    return ''' RegisterState {
      isEmailValid: $isEmailValid, 
      isPasswordValid: $isPasswordValid, 
      isSubmitting: $isSubmitting, 
      isSuccess: $isSuccess, 
      isFailure: $isFailure
    }
    ''';
  }

}







