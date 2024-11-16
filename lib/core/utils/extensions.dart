import '../../features/products/data/models/category_model.dart';
import '../../features/products/data/models/product_model.dart';
import '../../features/products/domain/entities/category_entity.dart';
import '../../features/products/domain/entities/product_entity.dart';

extension ListProductEntityX on List<ProductEntity> {
  List<ProductModel> fromEntity() {
    final products = <ProductModel>[];

    for (var productEntity in this) {
      final product = ProductModel(
        id: productEntity.id,
        title: productEntity.title,
        price: productEntity.price,
        description: productEntity.description,
        category: productEntity.category.fromEntity(),
        images: productEntity.images,
      );

      products.add(product);
    }

    return products;
  }
}

extension CategoryEntityX on CategoryEntity {
  CategoryModel fromEntity() {
    return CategoryModel(id: id, name: name, image: image);
  }
}
