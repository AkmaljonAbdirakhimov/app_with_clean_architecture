import 'package:app_with_clean_architecture/core/datastate/data_state.dart';

import 'package:app_with_clean_architecture/features/products/domain/entities/product_entity.dart';

import '../../domain/repositories/product_repository.dart';
import '../data_sources/local/product_local_service.dart';
import '../data_sources/remote/product_api_service.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApiService _productApiService;
  final ProductLocalService _productLocalService;

  ProductRepositoryImpl(
    this._productApiService,
    this._productLocalService,
  );

  @override
  Future<DataState<List<ProductEntity>>> getProducts() {
    return _productApiService.getProducts();
  }

  // @override
  // Future<DataState<List<ProductEntity>>> getProductsFromLocal() {
  //  // return _productLocalService.getProducts();
  // }
}
