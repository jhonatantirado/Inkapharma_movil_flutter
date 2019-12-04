import 'package:inkapharma/model/product.dart';

abstract class ProductRepository {
  Future<int> insert(Product product);
  Future<int> update(Product product);
  Future<int> delete(Product product);
  Future<Product> getProduct(Product product);
  Future<List<Product>> getList();
}