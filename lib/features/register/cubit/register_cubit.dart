import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/login/model/login_reponse_model.dart';
import 'package:e_commerce/features/register/cubit/register_state.dart';
import 'package:e_commerce/features/register/model/user.dart';
import 'package:e_commerce/features/register/repository/register_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepository) : super(RegisterInitial());

  RegisterRepository registerRepository;

  void register({required User user}) async {
    emit(LoadingRegisterState());
    final Either<String, AuthResponseModel> result = await registerRepository
        .register(user);

    result.fold(
      (error) {
        emit(ErrorRegisterState(error));
      },
      (right) {
        emit(SuccessRegisterState("Login Successfully"));
      },
    );
  }
}
