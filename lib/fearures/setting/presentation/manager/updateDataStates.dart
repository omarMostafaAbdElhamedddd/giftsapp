
abstract class UpdateDataStates{}

class InitUpdateDataState extends UpdateDataStates{}

class LoadingUpdateDataState extends UpdateDataStates{}

class SuccessUpdateDataState extends UpdateDataStates{}

class FailureUpdateDataState extends UpdateDataStates{
  final String errorMessage;
  FailureUpdateDataState({required this.errorMessage});
}