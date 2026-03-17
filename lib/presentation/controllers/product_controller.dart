import 'package:flutter/material.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/domain/usecases/get_product_use_case.dart';

class ProductController extends ChangeNotifier {
  final GetProductUseCase _getProductUseCase;
  List<ProductEntity> _products = [];
  bool _isLoading = false;
  String? error;

  ProductController(this._getProductUseCase);

  List<ProductEntity> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    try{
      _isLoading = true;
      _products = await _getProductUseCase.execute();
      error = null;

    }catch(e){
      error = "Falha ao carregar produtos: $e";
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}