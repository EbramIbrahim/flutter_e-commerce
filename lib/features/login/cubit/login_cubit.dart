import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/login/cubit/login_state.dart';
import 'package:e_commerce/features/login/model/login_reponse_model.dart';
import 'package:e_commerce/features/login/repository/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepository) : super(LoginInitial());

  LoginRepository loginRepository;

  void login({required String username, required String password}) async {
    emit(LoadingLoginState());
    final Either<String, AuthResponseModel> result = await loginRepository
        .login(username, password);

    result.fold(
      (error) {
        emit(ErrorLoginState(error));
      },
      (right) {
        emit(SuccessLoginState("Login Successfully"));
      },
    );
  }
}
