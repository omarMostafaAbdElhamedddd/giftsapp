
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gifts/fearures/sendGift/data/userModel.dart';
import 'package:gifts/fearures/sendGift/presentation/manager/getAppUsers/getAppUsersStates.dart';
import 'package:gifts/litls/widgets/requestFailure.dart';

class GetAppUsersService {
  Dio dio = Dio();

   Future<Either<Failure , List<UserModel>>> getAppUsers() async{
     final url = 'https://api.airogift.com/public/api/users/list';

     try{
       final response = await dio.get(url);
       List<UserModel> users =[];
       for(int i=0; i<response.data.length; i++){
         users.add(UserModel.fromJson(response.data[i]));
       }
       return Right(users);
     }catch(e){
       if(e is DioException){
         return Left(ServerFailure.fromDioError(e));
       }else{
         print(e);
         return Left(ServerFailure('Something went wrong, try again'));
       }
     }
   }

}

class GetAppUsersCubit extends Cubit<GetAppUsersStates>{
  GetAppUsersCubit(this.getAppUsersService) : super(InitStateGetAppUsers());

  GetAppUsersService getAppUsersService;

  Future<void> getAppUsers () async{
    emit(LoadingStateGetAppUsers());
   final result = await getAppUsersService.getAppUsers();
   result.fold((left) {
     emit(FailureStateGetAppUsers(errorMessage:left.errorMessage));
   }, (right){
     emit(SuccessStateGetAppUsers(users: right));
   });

  }
}