//import 'package:todo_app/services/location.dart';
import 'dart:convert';
import 'package:inkapharma/model/product.dart';
import 'package:inkapharma/services/webservice.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

const apiKey = '0f6dbc02cee2cd16bb57aeda2d9e1069';
const openWeatherMapURL = 'https://dycsw-inkapharmacy-netcore-api-anxious-echidna.cfapps.io/api/Products';
//?page=0&size=40

class ProductModel {

 static Resource<List<Product>> get all {
    
    return Resource(
      url: '$openWeatherMapURL?page=0&size=40',
      parse: (response) {
        final result = json.decode(response.body); 
        Iterable list = result['content'];
        return list.map((model) => 
            Product.fromJson(model)).toList();
      }
    );
  }


  Map toMap() {
    var map = new Map<String, dynamic>();
    map["customerId"] = 2;
    map["details"] = 3;
    [map["customerId"] ,2];
    return map;
  }

  Future<void> createPost(/*String url, {Map body}*/) async {

  String url = 'https://inkafarma-axon.cfapps.io/sales';

 var items = [];
  var item = {
    "productId": 1,
    "quantity": 20,
    "price": 5,
    "currency": "PEN",
    "status": 1
  };
  var item2 = {
    "productId": 2,
    "quantity": 50,
    "price": 12,
    "currency": "PEN",
    "status": 1
  };

  items.add(item);
  items.add(item2);

// create params
  var body = {
      "customerId": 2,
      "details": items
      };


  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    else
    {
      var ok = json.decode(response.body);
    }
    //return Post.fromJson(json.decode(response.body));
  });
}


  

}