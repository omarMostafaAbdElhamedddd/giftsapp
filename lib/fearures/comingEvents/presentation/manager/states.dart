


import 'package:gifts/fearures/sendGift/data/giftModel.dart';

import '../../data/eventModel.dart';

abstract class GetEventsStates{}

class InitStateGetEvents extends  GetEventsStates{}
class LoadingStateGetEvents extends  GetEventsStates{}
class SuccessStateGetEvents extends  GetEventsStates{
  final List<EventModel> event;
  SuccessStateGetEvents({required this.event});
}

class FailureStateGetEvents extends  GetEventsStates{
  final String message;
  FailureStateGetEvents({required this.message});
}


