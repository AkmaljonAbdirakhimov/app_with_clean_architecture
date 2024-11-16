import 'package:dio/dio.dart';

import '../../../../../core/datastate/data_state.dart';
import '../../../../../core/network/dio_client.dart';
import '../../models/product_model.dart';

abstract class ProductApiService {
  Future<DataState<List<ProductModel>>> getProducts();
}

class ProductApiServiceImpl implements ProductApiService {
  final DioClient _dioClient;

  ProductApiServiceImpl(this._dioClient);

  @override
  Future<DataState<List<ProductModel>>> getProducts() async {
    try {
      final response = await _dioClient.dio.get("/products");
      final products = List<ProductModel>.from(
          response.data.map((p) => ProductModel.fromMap(p)));

      return DataSuccess(products);
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(
        DioException(
          requestOptions: RequestOptions(),
          error: e,
        ),
      );
    }
  }
}
