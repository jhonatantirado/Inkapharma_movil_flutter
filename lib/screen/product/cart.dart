import 'package:flutter/material.dart';
import 'package:todo_app/model/product.dart';
import 'package:todo_app/data/database_helper.dart';
import 'package:todo_app/model/SaleOrderDetail.dart';
import 'dart:async';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:todo_app/components/GenerateCart.dart';
import 'package:todo_app/components/BottomBuyNow.dart';
import 'package:todo_app/infraestructure/Sqflite_ProductRepository.dart';
import 'package:http/http.dart' as http;

SqfliteProductRepository productRepository = SqfliteProductRepository(DatabaseHelper.get);

 double  _opacity = 1;
 double totalSale;
 List<Product> products = const <Product>[];

 class Cart extends StatefulWidget{
 
  @override
  State<StatefulWidget> createState() => CartState();
   
}


class CartState extends State<Cart>{

  static final CREATE_POST_URL = 'https://inkafarma-axon.cfapps.io/sales';

  @override
  initState() {
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {

      setState(() {
        final totalSaleFuture = productRepository.getTotalSale();
        totalSaleFuture.then((result) {
        setState(() {
          totalSale = result == null ? 0: num.parse( result.toStringAsFixed(2)) ;
          _opacity = totalSale > 0 ? 1: 0;
        });
      });
      });

    return Scaffold(
      appBar:AppBar(
        elevation: 0.0,
        title: Text("Shopping Cart"),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body:Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: Colors.grey[300],
                    width: 1.0
                )
            )
        ),
        child:
          ListView(
              shrinkWrap: true,
              children: products.map((d)=>GenerateCart(product:d, removeProduct: removeProduct)).toList(),
            ),
        ),
        bottomNavigationBar: BottomBuyNow(removeProduct: removeProduct, opacity: _opacity, totalSale:totalSale,buyNow: buyNow )//_indexBottom()
      );
  }

  void getData() {
      final productFuture = productRepository.getList();
      productFuture.then((productList) {
        setState(() {
          products = productList;
        });
      });
  }



 void removeProduct( Product product ) {
        productRepository.delete(product);
        getData();
  }

  void buyNow() async {
        
        List<SaleOrderDetail>  newDetails = new List<SaleOrderDetail>(); 
        products.forEach((f)=> 
          newDetails.add(new SaleOrderDetail(detailId: "", saleId: "", status: 1, price: f.price, productId: f.id , currency: "PEN", quantity: f.quantity))
         );

        Sale newSale = new Sale(customerId: 2, details: newDetails);

        Map newMap =newSale.toMap();
        String saleId = await createSale(CREATE_POST_URL, body: newMap);
        print(saleId);

        productRepository.deleteAllCarList();
        
        final storage = LocalStorage('app_data');
        storage.setItem("MsgVenta", "Successful purchase");
        Navigator.pop(context, true);
     
  }

   Future<String> createSale(String url, {Map body}) async {  
  
  return http.post(
      url
    , headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"}
    , body: json.encode(body))
    .then((http.Response response) {

      final int statusCode = response.statusCode;
      print(response.body);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }

    return response.body;
    });
    
    //return 'ok';
  }




  
}