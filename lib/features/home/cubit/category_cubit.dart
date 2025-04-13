import 'package:e_commerce/features/home/cubit/category_state.dart';
import 'package:e_commerce/features/home/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._homeRepository) : super(CategoryInitial());

  final HomeRepository _homeRepository;

  void getCategories() async {
    emit(CategoryLoading());

    final result = await _homeRepository.getCategories();
    result.fold(
      (error) {
        emit(CategoryError(error));
      },
      (right) {
        emit(CategorySuccess(right));
      },
    );
  }
}
