import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/network/dio_helper.dart';
import 'package:e_commerce/core/network/end_points.dart';
import 'package:e_commerce/features/home/model/categories.dart';
import 'package:e_commerce/features/home/model/products.dart';

class HomeRepository {
  final DioHelper _dioHelper;

  HomeRepository(this._dioHelper);

  Future<Either<String, List<Products>>> getProducts() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoitns: AppEndPoints.productsEndPoint,
      );

      if (response.statusCode == 200) {
        List<Products> products = productsFromJson(response.data);

        return Right(products);
      } else {
        return Left("Something go Wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<Products>>> getCategoryProducts(
    String category,
  ) async {
    try {
      final response = await _dioHelper.getRequest(
        endPoitns: "${AppEndPoints.catProductsEndPoint}/$category",
      );

      if (response.statusCode == 200) {
        List<Products> products = productsFromJson(response.data);

        return Right(products);
      } else {
        return Left("Something go Wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<String>>> getCategories() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoitns: AppEndPoints.categoriesEndPoint,
      );

      if (response.statusCode == 200) {
        List<String> categories = categoriesFromJson(response.data);
        categories.insert(0, "All");

        return Right(categories);
      } else {
        return Left("Something go Wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
