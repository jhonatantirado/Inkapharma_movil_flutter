 import 'package:flutter/material.dart';
 import 'package:todo_app/model/product.dart';
import 'package:todo_app/screen/product/product_page_detail.dart';
 
class ContentProduct extends StatelessWidget {

  const ContentProduct({Key key, this.product}) : super(key: key);
  final Product product;
  
  @override
  Widget build(BuildContext context) {

        return Card(
          color: Colors.white,
          child: Center(child: Column(
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
                                children: <Widget>[Expanded(child: Container(child: Image.network(product.imageUrl,fit: BoxFit.contain)))],                              
                              )
                          ,onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> Product_Detail( detail: product )));
                          })
                        ),
                        ),
                  SizedBox(height: 10.0),
                  Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("${product.name}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.0),),
                        ),
                  Padding(    
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text("\$${product.price.toString()}",style: TextStyle(fontWeight: FontWeight.w500),),
                              )
                            ],
                          ),
                    )
          ]
        ),
      )
    );
  }
}

