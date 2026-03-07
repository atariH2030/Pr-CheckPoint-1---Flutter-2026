import 'package:flutter/material.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/domain/repositories/product_repository.dart';

class ProductController extends ChangeNotifier {
  final ProductRepository repository;

  ProductController(this.repository);

  List<ProductEntity> products = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchProducts() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      products = await repository.getProducts();
    } catch (e) {
      error = 'Erro ao buscar produtos: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
