import '../../../../core/datastate/data_state.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> getProducts();
}
