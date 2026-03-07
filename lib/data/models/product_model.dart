import 'package:myapp/domain/entities/product_entity.dart';

// A diferença: ProductEntity é a camada de negócio, ProductModel é a camada de dados
class ProductModel extends ProductEntity {
  // Construtor que recebe id, title e price
  ProductModel({required super.id, required super.title, required super.price});

  // Factory é um construtor especial que cria um ProductModel a partir de um JSON (Map)
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],           // Pega o id do JSON
      title: json['title'],     // Pega o title do JSON
      price: json['price'],     // Pega o price do JSON
    );
  }
}
