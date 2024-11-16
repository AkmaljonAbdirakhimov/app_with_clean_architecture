import 'package:app_with_clean_architecture/core/datastate/data_state.dart';
import 'package:app_with_clean_architecture/core/utils/extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/product_model.dart';
import '../../../domain/usecases/get_products_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUsecase _getProductsUsecase;

  ProductBloc(this._getProductsUsecase) : super(const ProductState()) {
    on<GetProductsEvent>(_onGetProducts);
  }

  void _onGetProducts(GetProductsEvent event, emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final dataState = await _getProductsUsecase.call();

      if (dataState is DataSuccess) {
        emit(
          state.copyWith(
            products: dataState.data?.fromEntity() ?? [],
            isLoading: false,
          ),
        );
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(
          error: dataState.error?.response?.data,
          isLoading: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }
}
