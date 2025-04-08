import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gifts/fearures/sendGift/presentation/manager/states.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../litls/widgets/requestFailure.dart';
import '../../data/giftModel.dart';


class GetGiftsService {
  final Dio _dio = Dio();
  List<GiftModel> gifts = [];
  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token')!;
  }
  Future<Either<Failure,List< GiftModel>>> getGifts() async {
    final String url = 'https://api.airogift.com/public/api/gifts/gifts';
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
      List<GiftModel> gifts = [];

      for(int i=0 ; i<response.data['data'].length; i++){
        gifts.add(GiftModel.fromJson(response.data['data'][i]));
      }
      return Right(gifts);
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

class GetGiftsCubit extends Cubit<GetGiftsStates>{
  GetGiftsCubit(this.getGiftsService) : super(InitStateGetGifts());

  final GetGiftsService getGiftsService ;

  Future<void> getGifts () async{
    emit(LoadingStateGetGifts());
    final result= await getGiftsService.getGifts();
    result.fold((failure){
      emit(FailureStateGetGifts(message: failure.errorMessage));
    } , (gift){
      emit(SuccessStateGetGifts(gift: gift));
    });
  }
}

