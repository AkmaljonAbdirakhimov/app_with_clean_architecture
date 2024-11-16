import '../../domain/entities/product_entity.dart';
import 'category_model.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required int id,
    required String title,
    required int price,
    required String description,
    required CategoryModel category,
    required List<String> images,
  }) : super(
          id: id,
          title: title,
          price: price,
          description: description,
          category: category,
          images: images,
        );

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      description: map['description'],
      category: CategoryModel.fromMap(map['category']),
      images: map['images'].cast<String>(),
    );
  }
}
