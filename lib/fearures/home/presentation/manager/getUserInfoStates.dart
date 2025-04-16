
import 'package:gifts/fearures/home/data/userModel.dart';

import '../../../balance history/data/balanceHistoryModel.dart';
import '../../../balance history/data/giftModelHistory.dart';

abstract class GetUserInfoStates {}

class InitStateGetUserInfo extends GetUserInfoStates{}
class LoadingStateGetUserInfo extends GetUserInfoStates{}
class SuccessStateGetUserInfo extends GetUserInfoStates{
  final UserDataModel userDataModel;
  final List<GiftModelHistory> gifts;
  final List<BalanceHistoryModel> balances;
  final List<GiftModelHistory> pendingGifts;

  SuccessStateGetUserInfo( { required this.pendingGifts ,required this.userDataModel ,required this.gifts, required this.balances,});
}

class FailureStateGetUserInfo extends GetUserInfoStates{
  final String message;
  final int statusCode;
  FailureStateGetUserInfo({required this.message, required this.statusCode});


}