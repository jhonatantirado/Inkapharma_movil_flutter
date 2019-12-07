import 'package:flutter/material.dart';
import 'package:todo_app/model/product.dart';

class BottomBuyNow extends StatelessWidget {

final Function removeProduct;
final double opacity;
final double totalSale;
final Function buyNow;
const BottomBuyNow({Key key,this.removeProduct, this.opacity, this.totalSale, this.buyNow}) : super(key: key);

 @override
 Widget build(BuildContext context) {
  
  return  Opacity(opacity: opacity,
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
              children: 
              <Widget>
              [ Text("Total: ${totalSale.toString()}", style: TextStyle(color: Colors.white))],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.red,
              child:InkResponse(
                    onTap: () async{
                      buyNow();
                    },
                    child: Text("BUY NOW", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    )
              )
            )         
        ],
      )
    )
    );
}
}