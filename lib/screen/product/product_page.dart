import 'dart:async';
import 'package:flutter/material.dart';
import 'package:inkapharma/common/app_constants.dart';
import 'package:inkapharma/services/webservice.dart';
import 'package:inkapharma/screen/product/product_page_detail.dart';
import 'package:inkapharma/model/product.dart';
import 'package:localstorage/localstorage.dart';

class ProductListPage extends StatefulWidget {
  static const String id = 'product_page';
  ProductListPage();

  @override
  State<StatefulWidget> createState() => ProductListPageState();
}

class ProductListPageState extends State<ProductListPage> {
  final LocalStorage storage = new LocalStorage('app_data');

  @override
  void initState() {
    super.initState();
    _populateProducts();
  }

  void _populateProducts() {
    Webservice().load(Product.all).then((products) => {
          setState(() => {_products = products})
        });
  }

  showCartSnak(String msg){
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(msg,style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.green,
          duration: Duration(seconds: AppConstants.showSuccessfullPurchaseForXSeconds),
    ));
  }

  @override
  Widget build(BuildContext context) {
    
    String msgVenta = storage.getItem("MsgVenta");
    
    if ( msgVenta != null && msgVenta != '' )
    {        
        Timer(Duration(seconds: AppConstants.showSuccessfullPurchaseAfterXSeconds), () {
          showCartSnak(msgVenta);
          storage.setItem("MsgVenta", "");
          msgVenta = '';
        });
   }


    return MaterialApp(
      debugShowCheckedModeBanner: false
      ,home: Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(_products.length, (index) {
              return Center(
                child: ChoiceCard(product: _products[index]),
              );
           }
          )
        )
      )
    );
  }
}

List<Product> _products = const <Product>[];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100.0,
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      child: Image.network(product.imageUrl,
                                          fit: BoxFit.contain)))
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Product_Detail(detail: product)));
                          })),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "${product.name}",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text(
                          "\$${product.price.toString()}",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                )
              ]),
        ));
  }
}
