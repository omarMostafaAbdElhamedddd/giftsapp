abstract class RejectStates{}


class LoadingRejectState extends RejectStates{}
class InitRejectState extends RejectStates{}
class FailureRejectState extends RejectStates{
  final String message;
  FailureRejectState({required this.message,});
}
class SucessRejectState extends RejectStates{
}
