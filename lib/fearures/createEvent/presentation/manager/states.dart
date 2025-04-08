abstract class InsertEventStates {}
class InitStateInsertEvent extends InsertEventStates {}
class LoadingStateInsertEvent extends InsertEventStates {}
class SuccessStateInsertEvent extends InsertEventStates {}
class FailureStateInsertEvent extends InsertEventStates {
  final String message;
  FailureStateInsertEvent({required this.message});
}