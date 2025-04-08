import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gifts/fearures/createEvent/presentation/manager/states.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../litls/widgets/requestFailure.dart';

class InsertEventService {
  final Dio _dio = Dio();

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token')!;
  }

  Future<Either<Failure, void>> insertEvent({
    required String name,
    required String content,
    required String imagePath,
    required List<String> videos,
    required String date
  }) async {
    final String url = "https://api.airogift.com/public/api/events";
    final token = await getToken();

    FormData formData = FormData.fromMap({
      "name": name,
      "content": content,
      'date': date,
      "image": await MultipartFile.fromFile(imagePath),
      for (int i = 0; i < videos.length; i++) "videos[$i]": videos[i],

      // for (int i = 0; i < videos.length; i++)
      //   "videos[$i]": await MultipartFile.fromFile(videos[i]),

    });

    try {
      final response = await _dio.post(
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
        return Right(null);
      } else {
        return Left(ServerFailure('Failed to insert event'));
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





class InsertEventCubit extends Cubit<InsertEventStates> {
  InsertEventCubit(this.insertEventService) : super(InitStateInsertEvent());

  final InsertEventService insertEventService;

  Future<void> createEvent({
    required String name,
    required String content,
    required String imagePath,
    required List<String> videos,
    required String date,
  }) async {
    emit(LoadingStateInsertEvent());

    final result = await insertEventService.insertEvent(
      date: date,
      name: name,
      content: content,
      imagePath: imagePath,
      videos: videos,
    );

    result.fold(
          (failure) => emit(FailureStateInsertEvent(message: failure.errorMessage)),
          (_) => emit(SuccessStateInsertEvent()),
    );
  }
}
