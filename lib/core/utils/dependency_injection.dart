import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/products/data/data_sources/local/product_local_service.dart';
import '../../features/products/data/data_sources/remote/product_api_service.dart';
import '../../features/products/data/repositories/product_repository_impl.dart';
import '../../features/products/domain/usecases/get_products_usecase.dart';
import '../../features/products/presentation/bloc/product_bloc/product_bloc.dart';
import '../network/dio_client.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Dio
  getIt.registerSingleton<DioClient>(DioClient(Dio()));

  // Services
  getIt.registerSingleton<ProductApiServiceImpl>(
      ProductApiServiceImpl(getIt<DioClient>()));
  getIt.registerSingleton<ProductLocalServiceImpl>(ProductLocalServiceImpl());

  // Repositories
  getIt.registerSingleton<ProductRepositoryImpl>(ProductRepositoryImpl(
    getIt<ProductApiServiceImpl>(),
    getIt<ProductLocalServiceImpl>(),
  ));

  // Usecases
  getIt.registerSingleton<GetProductsUsecase>(
      GetProductsUsecase(getIt<ProductRepositoryImpl>()));

  // Blocs
  getIt.registerSingleton<ProductBloc>(
    ProductBloc(getIt<GetProductsUsecase>()),
  );
}
