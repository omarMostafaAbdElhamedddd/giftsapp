


import 'package:gifts/fearures/sendGift/data/giftModel.dart';

abstract class SendGiftStates{}

class InitStateSendGift extends  SendGiftStates{}
class LoadingStateSendGift extends  SendGiftStates{}
class SuccessStateSendGift extends  SendGiftStates{
}
class FailureStateSendGift extends  SendGiftStates{
  final String message;
  FailureStateSendGift({required this.message});
}





