import 'package:dio/dio.dart';

// Centraliza todas as requisições HTTP do app - funciona como intermediário entre app e API
class CustomHttpClient {
  final Dio dio;

  // Construtor: cria uma instância de Dio pronta para usar
  CustomHttpClient(): dio = Dio();

  // Busca todos os produtos da API de forma assíncrona
  // Future<Response> promete retornar uma resposta da API
  Future<Response> getProducts() async {
    // await aguarda a resposta antes de continuar
    return await dio.get('https://gdapp.com.br/api/fiap/products');
  }
}