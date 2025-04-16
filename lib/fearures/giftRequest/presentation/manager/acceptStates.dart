abstract class AcceptStates{}


class LoadingAcceptState extends AcceptStates{}
class InitAcceptState extends AcceptStates{}
class FailureAcceptState extends AcceptStates{
  final String message;
  FailureAcceptState({required this.message,});
}
class SucessAcceptState extends AcceptStates{
}
