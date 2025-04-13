import 'package:e_commerce/features/home/model/products.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  List<Products> products;
  ProductSuccess(this.products);
}

class ProductError extends ProductState {
  String message;
  ProductError(this.message);
}
