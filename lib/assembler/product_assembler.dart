import 'package:inkapharma/assembler/assembler.dart';
import 'package:inkapharma/model/product.dart';

class ProductAssembler implements Assembler<Product>{
  final tableName= 'Product';
  final columnId = 'id';
  final columnName = 'name';
  final columnPrice = 'price';
  final columnQuantity = 'quantity';
  final columnImageUrl = 'imageUrl';

  @override
  Product fromMap(Map<String, dynamic > query) {
    Product product = Product(query[columnName],query[columnPrice],query[columnQuantity],query[columnImageUrl]);
    return product;
  }

  @override
  Map<String, dynamic> toMap(Product product) {
    return <String, dynamic>{
      columnId: product.id,
      columnName: product.name,
      columnPrice: product.price,
      columnQuantity: product.quantity,
      columnImageUrl: product.imageUrl
    };
  }

  Product fromDbRow(dynamic row){
    return Product.withId(row[columnId], row[columnName],row[columnPrice],row[columnQuantity],row[columnImageUrl]);
  }

  @override
  List<Product> fromList(result) {
    List<Product> products = List<Product>();
    var count = result.length;
    for (int i=0; i<count;i++){
      products.add(fromDbRow(result[i]));
    }
    return products;
  }
}