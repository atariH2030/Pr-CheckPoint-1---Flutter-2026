import 'package:myapp/core/http_client.dart';
import 'package:myapp/data/models/product_model.dart';
import 'package:myapp/domain/entities/product_entity.dart';

class ProductDatasource{
  final CustomHttpClient httpClient;

  ProductDatasource(this.httpClient);

  Future<List<ProductEntity>> getProducts() async {
    final response = await httpClient.getProducts();

    return (response.data as List).map((e) => ProductModel.fromJson(e)).toList();
  }

}