
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gifts/fearures/giftRequest/presentation/manager/acceptStates.dart';
import 'package:gifts/litls/widgets/requestFailure.dart';

import '../../../../litls/consts.dart';

class AcceptService {
  final Dio _dio = Dio();

  static int? statisCode ;

  Future<Either<Failure,bool>> accept({required String id}) async {

    final String url  = "https://api.airogift.com/public/api/users/approve/$id";
    try {
      final response = await _dio.post(
        url,
      );
      print(response);
      if (response.statusCode == 200) {

        return Right(true);
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

class AcceptCubit extends Cubit<AcceptStates> {
  AcceptCubit(this.acceptService) : super(InitAcceptState());
  final AcceptService acceptService;
  Future<void> accept({ required String id}) async {
    emit(LoadingAcceptState());

    final result = await acceptService.accept(id: id );

    result.fold(
          (failure) {

        emit(FailureAcceptState(message: failure.errorMessage ));
      }, (token) {
      emit(SucessAcceptState());
    },
    );
  }
}