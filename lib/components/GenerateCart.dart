import 'package:flutter/material.dart';
import 'package:todo_app/model/product.dart';

class GenerateCart extends StatelessWidget {
 
final Product product;
final Function removeProduct;
const GenerateCart({Key key, this.product, this.removeProduct}) : super(key: key);

 @override
 Widget build(BuildContext context) {

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
               image: DecorationImage(image: NetworkImage( product.imageUrl),fit: BoxFit.fill)
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
                        Expanded(child: Text(product.name,style: TextStyle(fontWeight: FontWeight.w600,fontSize:15.0),),),
                        Expanded(child: Text("SubTotal ${  (product.quantity*product.price).toStringAsFixed(2)}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13.0),),),
                        Container(
                          alignment: Alignment.bottomRight,
                          child:InkResponse(
                                  onTap: (){
                                    removeProduct(product);
                                    //removeProduct(product);
                                  },
                                  child: Padding(padding: EdgeInsets.only(right: 10.0),child: Icon(Icons.remove_circle,color: Colors.red,),
                                  )
                              ) ,
                        )
                      ],
                    ),
                    Text("Price ${product.price.toString()}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13.0))
                    ,Row(
                      children: <Widget>[
                        Text("Quantity ${product.quantity.toString()}")
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