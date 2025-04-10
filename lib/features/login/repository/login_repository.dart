import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/dio_helper.dart';
import 'package:e_commerce/core/network/end_points.dart';
import 'package:e_commerce/core/utils/storage_services.dart';
import 'package:e_commerce/features/login/model/login_reponse_model.dart';

class LoginRepository {
  final DioHelper _dioHelper;
  final StorageServices _storageServices;

  LoginRepository(this._dioHelper, this._storageServices);

  Future<Either<String, AuthResponseModel>> login(
    String username,
    String password,
  ) async {
    try {
      Response response = await _dioHelper.postRequest(
        endPoints: AppEndPoints.loginEndPoint,
        body: {"username": username, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponseModel loginReponseModel = AuthResponseModel.fromMap(
          response.data,
        );
        if (loginReponseModel.token != null) {
          await _storageServices.saveToken(loginReponseModel.token!);
          return Right(loginReponseModel);
        } else {
          return const Left("Token is null");
        }
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

  Future<String?> getToken() async {
    return await _storageServices.readToken();
  }
}
