import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/dio_helper.dart';
import 'package:e_commerce/core/network/end_points.dart';
import 'package:e_commerce/features/login/model/login_reponse_model.dart';

class LoginRepository {
  Future<Either<String, LoginReponseModel>> login(
    String username,
    String password,
  ) async {
    try {
      Response response = await DioHelper.postRequest(
        endPoints: AppEndPoints.loginEndPoint,
        body: {"username": username, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginReponseModel loginReponseModel = LoginReponseModel.fromMap(
          response.data,
        );
        return Right(loginReponseModel);
      } else {
        return Left(response.toString());
      }
    } catch (error) {
      if (error is DioException) {
        return Left(error.response.toString());
      } else {
        return Left(error.toString());
      }
    }
  }
}
