import 'package:app_with_clean_architecture/core/usecase/usecase.dart';

import '../../../../core/datastate/data_state.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProductsUsecase extends Usecase<DataState<List<ProductEntity>>, void> {
  final ProductRepository _productRepository;

  GetProductsUsecase(this._productRepository);

  @override
  Future<DataState<List<ProductEntity>>> call({void params}) async {
    return await _productRepository.getProducts();
  }
}
