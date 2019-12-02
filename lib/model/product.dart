import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:todo_app/services/webservice.dart';
import 'package:todo_app/utils/Constants.dart';

class Product {
  const Product({this.title, this.icon, this.image, this.price, this.quantity});


  final double  price;
  final int quantity;
  final String title;
  final IconData icon;
  final String image;
  
  
  factory Product.fromJson(Map<String,dynamic> json) {
    return Product(
      title: json['name'], 
      price: json['price'], 
      quantity: 1,
      image:  json['imageUrl'] ?? Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL
    );
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
