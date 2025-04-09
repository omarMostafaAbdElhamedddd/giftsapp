
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gifts/fearures/chargeAccount/presentation/manager/states.dart';
import 'package:gifts/litls/widgets/requestFailure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharageAccountService {
  Dio dio = Dio();

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token')!;
  }
  Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('id')!;
  }

    Future<Either<Failure,bool>> chargeAccount({required dynamic balance}) async{
    final id = await getUserId();
      final String url = 'https://api.airogift.com/public/api/users/balance/$id';
       FormData formData = FormData();
      try{
        final result = await dio.post(url,
          data: {
          'balance': balance.toString(),
        },);




        return Right(true);
      }
      catch(e){
        if(e is DioException){
          return Left(ServerFailure.fromDioError(e));
        }else{
          return Left(ServerFailure('Something went wrong, try agin'));
        }

      }

    }

}
class ChargeAccountCubit extends Cubit<ChargeAccountStates> {

  ChargeAccountCubit(this.charageAccountService) : super(InitStateChargeAccount());
  CharageAccountService charageAccountService ;

  Future<void> charageAccount({required dynamic balance}) async{
    emit(LoadingStateChargeAccount());

    final result = await charageAccountService.chargeAccount(balance: balance);

    result.fold((left) {
      emit(FailureStateChargeAccount(errorMessage: left.errorMessage));
    }, (right){
      emit(SuccessStateChargeAccount());
    });


  }
}
