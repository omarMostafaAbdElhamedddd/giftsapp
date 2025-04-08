
import 'package:gifts/fearures/home/data/userModel.dart';

abstract class GetUserInfoStates {}

class InitStateGetUserInfo extends GetUserInfoStates{}
class LoadingStateGetUserInfo extends GetUserInfoStates{}
class SuccessStateGetUserInfo extends GetUserInfoStates{
  final UserDataModel userDataModel;

  SuccessStateGetUserInfo({required this.userDataModel});
}

class FailureStateGetUserInfo extends GetUserInfoStates{
  final String message;
  final int statusCode;
  FailureStateGetUserInfo({required this.message, required this.statusCode});


}