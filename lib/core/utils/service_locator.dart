import 'package:e_commerce/core/network/dio_helper.dart';
import 'package:e_commerce/core/utils/storage_services.dart';
import 'package:e_commerce/features/home/cubit/category_cubit.dart';
import 'package:e_commerce/features/home/cubit/product_cubit.dart';
import 'package:e_commerce/features/home/repository/home_repository.dart';
import 'package:e_commerce/features/login/cubit/login_cubit.dart';
import 'package:e_commerce/features/login/repository/login_repository.dart';
import 'package:e_commerce/features/register/cubit/register_cubit.dart';
import 'package:e_commerce/features/register/repository/register_repository.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  DioHelper dioHelper = DioHelper();
  sl.registerSingleton<DioHelper>(dioHelper);
  sl.registerLazySingleton(
    () => LoginRepository(sl<DioHelper>(), sl<StorageServices>()),
  );
  sl.registerFactory(() => LoginCubit(sl<LoginRepository>()));

  StorageServices storageServices = StorageServices();
  sl.registerSingleton<StorageServices>(storageServices);

  sl.registerLazySingleton(() => RegisterRepository(sl<DioHelper>()));
  sl.registerFactory(() => RegisterCubit(sl<RegisterRepository>()));

  sl.registerLazySingleton(() => HomeRepository(sl<DioHelper>()));

  sl.registerFactory(() => CategoryCubit(sl<HomeRepository>()));
  sl.registerFactory(() => ProductCubit(sl<HomeRepository>()));
}
