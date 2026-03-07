import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/product_controller.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // Executado uma única vez ao criar a página - local ideal para buscar dados da API
  @override
  void initState() {
    super.initState();
    final controller = context.read<ProductController>();
    // addPostFrameCallback evita erro de setState() durante build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    // context.watch registra mudanças no controller e reconstrói a página
    final controller = context.watch<ProductController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Produtos")),
      body: Builder(
        builder: (_) {
          // Mostra indicador de carregamento enquanto busca produtos
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Mostra mensagem de erro se houver falha na requisição
          if (controller.error != null) {
            return Center(child: Text(controller.error!));
          }

          // Exibe a lista de produtos
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (_, index) {
              final product = controller.products[index];

              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    (product.title.isNotEmpty) ? product.title[0] : '?',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(product.title),
                subtitle: Text("R\$ ${product.price}"),
              );
            },
          );
        },
      ),
    );
  }
}
