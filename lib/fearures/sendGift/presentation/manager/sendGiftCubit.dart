
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gifts/fearures/sendGift/presentation/manager/sendGiftStates.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../litls/widgets/requestFailure.dart';




class SendGiftService {
  final Dio _dio = Dio();

  static int? statisCode ;

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token')!;
  }

  Future<Either<Failure,List<String>>> sendGift({required Map<String,dynamic> orderData}) async {

    final String url  = "https://api.airogift.com/public/api/users/gift";
    final token  = await getToken();
    print(orderData);

    print(token);
    try {
      final response = await _dio.post(
          url,
          data: orderData,
          options: Options(
            headers: {
              // "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            },
          )
      );

      if (response.statusCode == 200) {
        return Right([]);
      } else {
        return Left(ServerFailure("Something went wrong, try again"));
      }
    } catch (e) {

      if (e is DioException) {
        print(e.toString());
        statisCode = e.response?.statusCode;
        print(e.error);
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}

class SendGiftCubit extends Cubit<SendGiftStates> {
  SendGiftCubit(this.sendGiftService) : super(InitStateSendGift());

  final SendGiftService sendGiftService;

  Future<void> createOrder({ required  Map<String,dynamic> orderData}) async {
    emit(LoadingStateSendGift());

    final result = await sendGiftService.sendGift(orderData: orderData );

    result.fold(
          (failure) {

        emit(FailureStateSendGift(message: failure.errorMessage  ));
      }, (data) {
      emit(SuccessStateSendGift());
    },
    );
  }
}
