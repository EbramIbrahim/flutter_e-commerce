import 'package:e_commerce/features/product_details/cubit/product_details_state.dart';
import 'package:e_commerce/features/product_details/repository/product_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._productDetailsRepository) : super(DetailsInitial());

  final ProductDetailsRepository _productDetailsRepository;

  void getProductDetails(int id) async {
    emit(LoadingDetails());
    final result = await _productDetailsRepository.getProductDetails(id);

    result.fold(
      (error) {
        emit(ErrorDetails(error));
      },
      (product) {
        emit(SuccessDetails(product));
      },
    );
  }
}
