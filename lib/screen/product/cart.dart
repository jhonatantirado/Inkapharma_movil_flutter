import 'package:flutter/material.dart';
import 'package:todo_app/model/product.dart';
import 'package:todo_app/infraestructure/Sqflite_ProductRepository.dart';
import 'package:todo_app/data/database_helper.dart';

SqfliteProductRepository productRepository = SqfliteProductRepository(DatabaseHelper.get);

 List<Product> products = const <Product>[
  ];


class Cart extends StatefulWidget{
  static final String route = "Cart-route";


  @override
  State<StatefulWidget> createState() {
    
    
    return CartState();
  }
}


class CartState extends State<Cart>{
    
  // List<Product> products;

  @override
  initState() {
    super.initState();
    getData();
    //getProduct(widget.detail);
  }

void getData() {
      final productFuture = productRepository.getList();
      productFuture.then((productList) {
        setState(() {
          products = productList;
        });
      });
  }


  @override
  Widget build(BuildContext context) {
  
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
              children: products.map((d)=>generateCart(d)).toList(),
            ),
        ),
      );
  }

  Widget generateCart(Product d){
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white12,
                 border: Border(
                      bottom: BorderSide(color: Colors.grey[50],width: 10.0),
                      top: BorderSide(color: Colors.grey[50],width: 1.0),)
        ),
        height: 100.0,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5.0)],
                borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),bottomRight: Radius.circular(10.0)
                ),
               image: DecorationImage(image: NetworkImage( d.imageUrl),fit: BoxFit.fill)
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0,left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(child: Text(d.name,style: TextStyle(fontWeight: FontWeight.w600,fontSize:15.0),),),
                        Expanded(child: Text("PriceA ${d.price.toString()}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.0),),),
                        //Expanded(child: Text("PriceA ${d.price.toString()}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13.0),),),
                        Container(
                          alignment: Alignment.bottomRight,
                          child:InkResponse(
                                  onTap: (){
                                    //model.removeCart(d);
                                  },
                                  child: Padding(padding: EdgeInsets.only(right: 10.0),child: Icon(Icons.remove_circle,color: Colors.red,),
                                  )
                              ) ,
                        )
                      ],
                    ),
                    Text("Price ${d.price.toString()}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13.0))
                    ,Row(
                      children: <Widget>[
                    SizedBox(height: 5.0,),
                    /*,Container(
                          alignment: Alignment.bottomRight,
                          child:InkResponse(
                                  onTap: (){/*model.removeCart(d);*/},
                                  child: Padding(padding: EdgeInsets.only(right: 10.0),child: Icon(Icons.add,color: Colors.blue,))
                              ) ,
                        )*/
                    SizedBox(width: 10.0,)
                    ,Text("quantity.toString(),")
                    ,SizedBox(width: 10.0,)
                    /*,Container(
                      alignment: Alignment.bottomRight,
                      child:InkResponse(
                              onTap: (){/*model.removeCart(d);*/},
                              child: Padding(padding: EdgeInsets.only(right: 10.0),child: Icon(Icons.remove,color: Colors.blue,))
                          ) ,
                      )*/
                    ])
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }


  

  
}