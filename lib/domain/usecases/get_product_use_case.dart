import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/domain/repositories/product_repository.dart';

class GetProductUseCase {
  final ProductRepository productRepository;

  GetProductUseCase(this.productRepository);

  Future<List<ProductEntity>> execute() async {
    return productRepository.getProducts();
  }
}