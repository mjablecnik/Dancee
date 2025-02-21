import 'package:dancee_app/entities/product.dart';
import 'package:vader_app/vader_app.dart';

class ProductRepository extends Repository {
  ProductRepository({
    required super.httpClient,
    required super.storageClient,
  });

  Future<List<Product>> getProducts() async {
    final response = await httpClient.request(
      path: '/products',
      method: HttpMethod.get,
    );
    return [...response.data["products"].map((e) => Product.fromJson(e))];
  }
}
