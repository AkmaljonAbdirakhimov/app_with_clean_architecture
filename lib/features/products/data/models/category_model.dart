import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required int id,
    required String name,
    required String image,
  }) : super(id: id, name: name, image: image);

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
    );
  }
}
