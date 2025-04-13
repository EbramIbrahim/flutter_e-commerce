import 'package:e_commerce/features/home/cubit/product_state.dart';
import 'package:e_commerce/features/home/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._homeRepository) : super(ProductInitial());

  final HomeRepository _homeRepository;

  void getProducts() async {
    emit(ProductLoading());

    final result = await _homeRepository.getProducts();

    result.fold(
      (error) {
        emit(ProductError(error));
      },
      (right) {
        emit(ProductSuccess(right));
      },
    );
  }

  void getCategoryProducts(String category) async {
    emit(ProductLoading());

    final result = await _homeRepository.getCategoryProducts(category);

    result.fold(
      (error) {
        emit(ProductError(error));
      },
      (right) {
        emit(ProductSuccess(right));
      },
    );
  }
}
