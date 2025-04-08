


import 'package:gifts/fearures/sendGift/data/giftModel.dart';

abstract class GetGiftsStates{}

class InitStateGetGifts extends  GetGiftsStates{}
class LoadingStateGetGifts extends  GetGiftsStates{}
class SuccessStateGetGifts extends  GetGiftsStates{
  final List<GiftModel> gift;
  SuccessStateGetGifts({required this.gift});
}

class FailureStateGetGifts extends  GetGiftsStates{
  final String message;
  FailureStateGetGifts({required this.message});
}


