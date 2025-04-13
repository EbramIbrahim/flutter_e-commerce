import 'package:e_commerce/features/home/model/products.dart';

abstract class ProductDetailsState {}

class DetailsInitial extends ProductDetailsState {}

class LoadingDetails extends ProductDetailsState {}

class SuccessDetails extends ProductDetailsState {
  Products products;
  SuccessDetails(this.products);
}

class ErrorDetails extends ProductDetailsState {
  String message;
  ErrorDetails(this.message);
}
