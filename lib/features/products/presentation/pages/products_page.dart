import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc/product_bloc.dart';
import '../widgets/product_item.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.error != null) {
            return Column(
              children: [
                Text(state.error.toString()),
                const SizedBox(height: 10),
                FilledButton(
                  onPressed: () {
                    context.read<ProductBloc>().add(GetProductsEvent());
                  },
                  child: const Text("Qayta o'rinish"),
                ),
              ],
            );
          }

          final products = state.products;

          if (products.isEmpty) {
            return const Center(
              child: Text("Mahsulotlar mavjud emas"),
            );
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductItem(
                product: product,
              );
            },
          );
        },
      ),
    );
  }
}
