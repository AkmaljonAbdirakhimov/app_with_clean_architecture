import 'package:app_with_clean_architecture/features/products/presentation/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/dependency_injection.dart';
import 'features/products/presentation/bloc/product_bloc/product_bloc.dart';

void main() {
  initDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => getIt<ProductBloc>()..add(GetProductsEvent()),
      child: const MaterialApp(
        home: ProductsPage(),
      ),
    );
  }
}
