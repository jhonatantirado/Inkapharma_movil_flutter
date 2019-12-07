import 'package:flutter/material.dart';
import 'package:todo_app/services/webservice.dart';
import 'package:todo_app/model/product.dart';
import 'package:localstorage/localstorage.dart';
import 'package:todo_app/components/CartSnack.dart';
import 'package:todo_app/components/CustomBar.dart';
import 'package:todo_app/components/ContentProduct.dart';

List<Product> _products = const <Product>[];

class ProductListPage extends StatefulWidget {

  Product mensajeConfirm;
  ProductListPage({this.mensajeConfirm});

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

  @override
  Widget build(BuildContext context) {

    _verifyMessage();

    return MaterialApp(
      debugShowCheckedModeBanner: false
      ,home: Scaffold(
        appBar: CustomBar(),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(_products.length, (index) {
              return Center(child: ContentProduct(product: _products[index]));
           }
          )
        )
      )
    );
  }


  void _populateProducts(){    
    Webservice().load(Product.all).then((products) => {
      setState(() => {
        _products  = products
      })
    });
  }

  void _verifyMessage(){    

      String msgVenta = storage.getItem("MsgVenta");
      if ( msgVenta != null && msgVenta != '' )
      {        
          showCartSnak(msgVenta, true, context);
          storage.setItem("MsgVenta", "");
          msgVenta = '';
    }

  }
}



