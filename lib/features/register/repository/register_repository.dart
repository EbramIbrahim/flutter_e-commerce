import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/dio_helper.dart';
import 'package:e_commerce/core/network/end_points.dart';
import 'package:e_commerce/features/login/model/login_reponse_model.dart';
import 'package:e_commerce/features/register/model/user.dart';

class RegisterRepository {
  final DioHelper _dioHelper;

  RegisterRepository(this._dioHelper);

  Future<Either<String, AuthResponseModel>> register(User user) async {
    try {
      Response response = await _dioHelper.postRequest(
        endPoints: AppEndPoints.registerEndPoint,
        body: {
          "username": user.username,
          "email": user.email,
          "password": user.password,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponseModel authResponseModel = AuthResponseModel.fromMap(
          response.data,
        );
        return Right(authResponseModel);
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
