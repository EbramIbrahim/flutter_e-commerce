import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/network/dio_helper.dart';
import 'package:e_commerce/core/network/end_points.dart';
import 'package:e_commerce/features/home/model/products.dart';

class ProductDetailsRepository {
  final DioHelper _dioHelper;

  ProductDetailsRepository(this._dioHelper);

  Future<Either<String, Products>> getProductDetails(int id) async {
    try {
      final response = await _dioHelper.getRequest(
        endPoitns: "${AppEndPoints.productsEndPoint}/$id",
      );

      if (response.statusCode == 200) {
        Products products = Products.fromJson(response.data);
        return Right(products);
      } else {
        return Left("Somthing Went Wrong...");
      }
    } catch (error) {
      return Left(error.toString());
    }
  }
}
