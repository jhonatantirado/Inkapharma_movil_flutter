import 'package:flutter/material.dart';
import 'package:inkapharma/common/shared_preferences.dart';
import 'package:inkapharma/common/app_constants.dart';
import 'package:inkapharma/model/product.dart';
import 'package:inkapharma/infraestructure/Sqflite_ProductRepository.dart';
import 'package:inkapharma/data/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:inkapharma/model/SaleOrderDetail.dart';
import 'dart:async';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';

SqfliteProductRepository productRepository =
    SqfliteProductRepository(DatabaseHelper.get);

double _opacity = 1;
double totalSale;
List<Product> products = const <Product>[];
String token;

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CartState();
}

class CartState extends State<Cart> {

  @override
  initState() {
    super.initState();
    getData();
    getToken();
  }

  void getData() {
    final productFuture = productRepository.getList();
    productFuture.then((productList) {
      setState(() {
        products = productList;
      });
    });
  }

  void getToken() async {
    final myToken = await read('firebaseToken');
    setState(() {
      token = myToken;
    });
  }

  Future<String> createSale(String url, {Map body}) async {
    return http
        .post(url,
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            },
            body: json.encode(body))
        .then((http.Response response) {
      final int statusCode = response.statusCode;
      print(response.body);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception(AppConstants.errorFetchingData);
      }

      return response.body;
    });
  }

  void remove_Product(Product product) {
    productRepository.delete(product);
    getData();
  }

  void buy_Now() async {
    List<SaleOrderDetail> newDetails = new List<SaleOrderDetail>();
    products.forEach((f) => newDetails.add(new SaleOrderDetail(
        detailId: "",
        saleId: "",
        status: 1,
        price: f.price,
        productId: f.id,
        currency: AppConstants.peruCurrencyISOCode,
        quantity: f.quantity)));

    Sale newSale =
        new Sale(customerId: 2, details: newDetails, firebaseToken: token);

    Map newMap = newSale.toMap();
    String saleId = await createSale( AppConstants.CREATE_POST_URL, body: newMap);
    print(saleId);

    productRepository.deleteAllCarList();

    final storage = LocalStorage('app_data');
    storage.setItem("MsgVenta", AppConstants.successfullPurchase + saleId);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      final totalSaleFuture = productRepository.getTotalSale();
      totalSaleFuture.then((result) {
        setState(() {
          totalSale = result == null ? 0 : num.parse(result.toStringAsFixed(2));
          _opacity = totalSale > 0 ? 1 : 0;
        });
      });
    });

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(AppConstants.shoppingCartTitle),
        ),
        backgroundColor: Color(0xFFF5F5F5),
        body: Container(
          decoration: BoxDecoration(
              border:
                  Border(top: BorderSide(color: Colors.grey[300], width: 1.0))),
          child: ListView(
            shrinkWrap: true,
            children: products.map((d) => generateCart(d)).toList(),
          ),
        ),
        bottomNavigationBar: _indexBottom());
  }

  Widget _indexBottom() {
    return Opacity(
        opacity: _opacity,
        child: Container(
            height: 56,
            margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Row(
              children: <Widget>[
                Container(
                  width: 200,
                  color: Colors.blueAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Total: ${totalSale.toString()}",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        color: Colors.red,
                        child: InkResponse(
                          onTap: () async {
                            buy_Now();
                          },
                          child: Text(AppConstants.buyNowLabel,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        )))
              ],
            )));
  }

  Widget generateCart(Product d) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white12,
            border: Border(
              bottom: BorderSide(color: Colors.grey[50], width: 10.0),
              top: BorderSide(color: Colors.grey[50], width: 1.0),
            )),
        height: 100.0,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5.0)
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  image: DecorationImage(
                      image: NetworkImage(d.imageUrl), fit: BoxFit.fill)),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          d.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15.0),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "SubTotal ${(d.quantity * d.price).toStringAsFixed(2)}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13.0),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: InkResponse(
                            onTap: () {
                              remove_Product(d);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                            )),
                      )
                    ],
                  ),
                  Text("Price ${d.price.toString()}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 13.0)),
                  Row(children: <Widget>[
                    Text("Quantity ${d.quantity.toString()}")
                  ])
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
