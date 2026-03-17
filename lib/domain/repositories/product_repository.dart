import 'package:myapp/domain/entities/product_entity.dart';

//Esse é o contrato entre a camada de dominínio e a camada com data.
abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();

}
