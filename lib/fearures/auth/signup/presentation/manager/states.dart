
abstract class RegisterStates {}

class InitStateRegister extends RegisterStates{}

class LoadingStateRegister extends RegisterStates{}

class SuccessStateRegister extends RegisterStates{}

class FailureStateRegister extends RegisterStates{
  final String message;
  FailureStateRegister({required this.message});

}
