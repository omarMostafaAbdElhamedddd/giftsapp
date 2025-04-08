import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gifts/fearures/auth/login/presentation/manager/states.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../litls/consts.dart';
import '../../../../../litls/widgets/requestFailure.dart';



class LoginService {
  final Dio _dio = Dio();

  static int? statisCode ;

  Future<Either<Failure,String>> login({required String username , required String password}) async {

    final String url  = "${baseUrl}auth/login?email=$username&password=$password";
    try {
      final response = await _dio.post(
        url,
      );
      print(response);
      if (response.statusCode == 200) {

        final token = response.data['access_token'];
        final user_id = response.data['user_id'];
        print(token);

            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('token',token);
           await prefs.setString('id',user_id.toString());


          return Right(token);
      } else {
        return Left(ServerFailure('Something went wrong, try again'));
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

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginService) : super(InitLoginState());
  final LoginService loginService;
  Future<void> login({ required String username, required String password}) async {
    emit(LoadingLoginState());

    final result = await loginService.login(username: username, password:password);

    result.fold(
          (failure) {

        emit(FailureLoginState(message: failure.errorMessage , statusCode:LoginService.statisCode ));
      }, (token) {
        emit(SucessLoginState(token: token));
      },
    );
  }
}
