import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/http_client.dart';
import 'data/datasources/product_datasource.dart';
import 'data/repositories/product_repository_impl.dart';
import 'presentation/controllers/product_controller.dart';
import 'presentation/pages/product_page.dart';

void main() {
  final httpClient = CustomHttpClient();
  final datasource = ProductDatasource(httpClient);
  final repository = ProductRepositoryImpl(datasource);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ProductController(repository),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumo de API Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ProductPage(),
    );
  }
}
