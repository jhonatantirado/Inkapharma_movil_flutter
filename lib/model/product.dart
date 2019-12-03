import 'dart:convert';
import 'package:todo_app/services/webservice.dart';
import 'package:todo_app/common/app_constants.dart';

class Product {
  
  int id;
  String name;
  double  price;
  int quantity;
  String imageUrl;

  Product(this.name, this.price, this.quantity, this.imageUrl);
  Product.withId(this.id, this.name, this.price, this.quantity, this.imageUrl);
  //Product( {this.id , this.name, this.price, this.imageUrl, this.quantity});

  factory Product.fromJson(Map<String,dynamic> json) {

    return Product.withId( 
         json['id']
        ,json['name']
        ,json['price'] 
        , 1
        ,  json['imageUrl'] ?? AppConstants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL);

    /*return Product(
      id: json['id'], 
      name: json['name'], 
      price: json['price'], 
      quantity: 1,
      imageUrl:  json['imageUrl'] ?? AppConstants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL
    );*/

  }

   static Resource<List<Product>> get all {
    
     return Resource(
       url: 'https://dycsw-inkapharmacy-netcore-api-anxious-echidna.cfapps.io/api/Products?page=0&size=40',
       parse: (response) {
         final result = json.decode(response.body); 
         Iterable list = result['content'];
         return list.map((model) => Product.fromJson(model)).toList();
       }
     );
   }
  
}
