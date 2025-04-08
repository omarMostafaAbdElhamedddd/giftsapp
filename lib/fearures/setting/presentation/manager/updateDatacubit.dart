import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gifts/fearures/setting/presentation/manager/updateDataStates.dart';
import 'package:gifts/litls/widgets/requestFailure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateDataservice {
  Dio dio = Dio();

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token')!;
  }
  Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('id')!;
  }

  Future<Either<Failure, bool>> updateData({

    required String image,
  }) async {
    String id = await getUserId();

    final String url = 'https://api.airogift.com/public/api/users/image/$id';
    final token = await getToken();
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image),
    });

    try {
      final response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(true);
      } else {
        return Left(ServerFailure('Failed to update data'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure("Something went wrong, try again"));
      }
    }
  }
}

class UpdateDatacubit extends Cubit<UpdateDataStates> {
  UpdateDatacubit(this.updateDataservice) : super(InitUpdateDataState());

  UpdateDataservice updateDataservice;

  Future<void> updateData({
    required String image,
  }) async {
   emit(LoadingUpdateDataState());
    final result =  updateDataservice.updateData(image: image,);

    result.fold((left){
      emit(FailureUpdateDataState(errorMessage: left.errorMessage));
    }, (right) {
      emit(SuccessUpdateDataState());
    } );
  }
}
