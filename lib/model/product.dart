import 'dart:convert';
import 'package:inkapharma/services/webservice.dart';
import 'package:inkapharma/common/app_constants.dart';

class Product {
  
  int id;
  String name;
  double  price;
  int quantity;
  String imageUrl;

  Product(this.name, this.price, this.quantity, this.imageUrl);
  Product.withId(this.id, this.name, this.price, this.quantity, this.imageUrl);

  factory Product.fromJson(Map<String,dynamic> json) {

    return Product.withId( 
         json['id']
        ,json['name']
        ,json['price'] 
        , 1
        ,  json['imageUrl'] ?? AppConstants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL);
  }

   static Resource<List<Product>> get all {
    
     return Resource(
       url: AppConstants.productlistAPIUrl,
       parse: (response) {
         final result = json.decode(response.body); 
         Iterable list = result['content'];
         return list.map((model) => Product.fromJson(model)).toList();
       }
     );
   }
  
}
