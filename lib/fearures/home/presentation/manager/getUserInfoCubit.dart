import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gifts/fearures/balance%20history/data/balanceHistoryModel.dart';
import 'package:gifts/fearures/balance%20history/data/giftModelHistory.dart';
import 'package:gifts/fearures/home/data/userModel.dart';
import 'package:gifts/fearures/home/presentation/manager/getUserInfoStates.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../litls/widgets/requestFailure.dart';



class GetUserInfoService {
 static String? image ;
  final Dio _dio = Dio();

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token')!;
  }

 Future<String> getUserId() async {
   final prefs = await SharedPreferences.getInstance();
   return prefs.getString('id')!;
 }
  Future<Either<List<dynamic>,List<dynamic>>> getUserData() async {
    String id = await getUserId();

    final String url = 'https://api.airogift.com/public/api/users/profile/$id';


    String token = await getToken();

    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

  UserDataModel userDataModel ;

  List<GiftModelHistory> giftsHistory = [];
  List<BalanceHistoryModel> balanceHistory = [];


      List<GiftModelHistory> giftsHistoryPenading = [];


  for(int i=0; i<response.data['data']['transactions'].length; i++,){
 final type = response.data['data']['transactions'][i]['type'] ?? null;
    if(type !='balance' && type !=null){
       giftsHistory.add(GiftModelHistory.fromJson(response.data['data']['transactions'][i]));

       if(response.data['data']['transactions'][i]['status']==null){

         giftsHistoryPenading.add(GiftModelHistory.fromJson(response.data['data']['transactions'][i]));

       }

    }else if(type !=null){
        balanceHistory.add( BalanceHistoryModel.fromjson(response.data['data']['transactions'][i]));
    }
  }




  final int ? errorStatusCode = response.data['responseStatus'] ?? 0;

  if (errorStatusCode!=403) {
    userDataModel = UserDataModel.fromJson(response.data['data']);
    image = userDataModel.image;

        return Right([userDataModel,giftsHistory , balanceHistory ,giftsHistoryPenading]);
  }else{
    return Left([ServerFailure('Something went wrong, try again'), 403]);
  }
    } catch (e) {
      if (e is DioException) {
        return Left([ServerFailure.fromDioError(e) ,e.response!.statusCode]);
      } else {
        return Left([ServerFailure('Something went wrong, try again'),]);
      }
    }
  }
}

class GetUseriInfoCbit extends Cubit<GetUserInfoStates>{
  GetUseriInfoCbit(this.getUserInfoService) : super(InitStateGetUserInfo());

  final GetUserInfoService getUserInfoService ;

  Future<void> getUserInfo () async{
    emit(LoadingStateGetUserInfo());

    final result= await getUserInfoService.getUserData();
    result.fold((failure){
      emit(FailureStateGetUserInfo(message: failure[0].errorMessage, statusCode: failure[1]));
    } , (list){
      emit((SuccessStateGetUserInfo(userDataModel: list[0] , gifts: list[1] , balances: list[2], pendingGifts:list[3] )));
    });
  }
}

