import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gifts/fearures/auth/signup/presentation/manager/states.dart';
import 'package:gifts/litls/widgets/requestFailure.dart';

class ReisterService {
  final Dio dio = Dio();

  Future<Either<Failure, bool>> register(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    String url =
        "https://api.airogift.com/public/api/auth/new-user?email=${email}&password=${password}&mobile=${phone}&name=${name}&roles[0]=2&password_confirmation=${password}";
    try {
      final response = await dio.post(url);

      if (response.statusCode == 200) {
        return Right(true);
      } else {
        return Left(ServerFailure('Something went wrong, try again'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure("Something went wrong, try again"));;
      }
    }
  }
}

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this.reisterService) : super(InitStateRegister());
  ReisterService reisterService;

  Future<void> register(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    emit(LoadingStateRegister());
    final result = await reisterService.register(email, password, name, phone);
    result.fold((left) {
      emit(FailureStateRegister(message: left.errorMessage));
    }, (right) {
      emit(SuccessStateRegister());
    });
  }
}
