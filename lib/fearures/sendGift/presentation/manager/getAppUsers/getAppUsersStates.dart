
import '../../../data/userModel.dart';

abstract class GetAppUsersStates {}

class InitStateGetAppUsers extends GetAppUsersStates{}

class LoadingStateGetAppUsers extends GetAppUsersStates{}

class SuccessStateGetAppUsers extends GetAppUsersStates{
  final List<UserModel> users;
  SuccessStateGetAppUsers({required this.users});

}

class FailureStateGetAppUsers extends GetAppUsersStates{
  final String errorMessage;
  FailureStateGetAppUsers({required this.errorMessage});
}


