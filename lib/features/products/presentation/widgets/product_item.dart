import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      subtitle: Text(
        product.description,
        maxLines: 2,
      ),
      trailing: Text(product.price.toString()),
    );
  }
}
