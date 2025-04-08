abstract class LoginStates{}


class LoadingLoginState extends LoginStates{}
class InitLoginState extends LoginStates{}
class FailureLoginState extends LoginStates{
  final String message;
  final int? statusCode ;
  FailureLoginState({required this.message,this.statusCode});
}
class SucessLoginState extends LoginStates{
  final String token;

  SucessLoginState({ required this.token});
}
