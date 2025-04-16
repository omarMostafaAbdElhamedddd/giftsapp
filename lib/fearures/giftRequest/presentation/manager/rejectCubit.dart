
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gifts/fearures/giftRequest/presentation/manager/acceptStates.dart';
import 'package:gifts/fearures/giftRequest/presentation/manager/rejectStates.dart';
import 'package:gifts/litls/widgets/requestFailure.dart';

import '../../../../litls/consts.dart';

class RejectService {
  final Dio _dio = Dio();

  static int? statisCode ;

  Future<Either<Failure,bool>> reject({required String id}) async {

    final String url  = "https://api.airogift.com/public/api/users/reject/$id";
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

class RejectCubit extends Cubit<RejectStates> {
  RejectCubit(this.acceptService) : super(InitRejectState());
  final RejectService acceptService;
  Future<void> reject({ required String id}) async {
    emit(LoadingRejectState());

    final result = await acceptService.reject(id: id );

    result.fold(
          (failure) {

        emit(FailureRejectState(message: failure.errorMessage ));
      }, (token) {
      emit(SucessRejectState());
    },
    );
  }
}