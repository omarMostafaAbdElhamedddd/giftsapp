

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gifts/fearures/comingEvents/presentation/manager/states.dart';
import 'package:gifts/fearures/sendGift/presentation/manager/states.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../litls/widgets/requestFailure.dart';
import '../../data/eventModel.dart';

class GetEventsService {
  final Dio _dio = Dio();
  List<EventModel> gifts = [];
  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token')!;
  }
  Future<Either<Failure,List< EventModel>>> getEvents() async {
    final String url = 'https://api.airogift.com/public/api/events/events';
    String token = await getToken();
    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            // "Content-Type": "application/json",
          },
        ),
      );
      List<EventModel> events = [];

      for(int i=0 ; i<response.data['data'].length; i++){
        events.add(EventModel.fromJson(response.data['data'][i]));
      }
      return Right(events);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return Left(ServerFailure.fromDioError(e));
      } else {
        print(e);
        return Left(ServerFailure("Something went wrong, try again"));
      }
    }
  }
}

class GetEventsCubit extends Cubit<GetEventsStates>{
  GetEventsCubit(this.getEventsService) : super(InitStateGetEvents());

  final GetEventsService getEventsService ;

  Future<void> getEvents () async{

    emit(LoadingStateGetEvents());

    final result= await getEventsService.getEvents();

    result.fold((failure){

      emit(FailureStateGetEvents(message: failure.errorMessage));

    } , (event){

      emit(SuccessStateGetEvents( event: event));

    });
  }
}

