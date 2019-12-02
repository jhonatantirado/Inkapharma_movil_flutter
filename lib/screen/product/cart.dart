import 'package:flutter/material.dart';
import 'package:inkapharma/model/choice.dart';

const List<Choice> choices = const <Choice>[
  const Choice( quantity: 1, price: 10.0, title: 'Product1', icon: Icons.directions_car, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/c/accu-chek-instant-s-test-strips-50-s-835774208.jpg"),
  const Choice( quantity: 1,price: 5.0, title: 'Product2', icon: Icons.directions_bike, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/c/accu-chek-active-test-strip-50-s-15580684.jpg"),
  const Choice( quantity: 1,price: 10.0,title: 'Product3', icon: Icons.directions_boat, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/c/accusure-simple-gluco-test-strip-50s--857449581.jpg"),
  const Choice( quantity: 1,price: 5.05,title: 'Product4', icon: Icons.directions_bus, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/c/accu-chek-instant-s-blood-glucose-monitor-1-s_812638_556.jpg"),
  const Choice( quantity: 1,price: 10.00,title: 'Product5', icon: Icons.directions_railway, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/c/accusure-simple-gluco-meter-with-25-strips--857447929.jpg"),
  const Choice( quantity: 1,price: 5.00,title: 'Product6', icon: Icons.directions_walk, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/e/n/ensure-diabetes-care-vanilla-powder-400gm-413072622.jpg"),
  const Choice( quantity: 1,price: 10.00,title: 'Product7', icon: Icons.directions_car, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/v/avalife-diabetes-support-tablets-60-s-828634372.jpg"),
  const Choice( quantity: 1,price: 5.00,title: 'Product8', icon: Icons.drafts, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/p/apollo-sugar-glucome-glucometer-glucome-strips-25s-pack-diabetes-foot-wear-voucher-worth-rupees-500-1-s-846888757.jpg"),
  const Choice( quantity: 1,price: 10.0,title: 'Product9', icon: Icons.dvr, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/l/allen-a08-diabetes-drops-30-ml-830953142.jpg")
  ];


class Cart extends StatefulWidget{
  static final String route = "Cart-route";

  @override
  State<StatefulWidget> createState() {
    
    return CartState();
  }
}

class CartState extends State<Cart>{
    
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
              children: choices.map((d)=>generateCart(d)).toList(),
            ),
        ),
      );
  }

  Widget generateCart(Choice d){
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
               image: DecorationImage(image: NetworkImage( d.image),fit: BoxFit.fill)
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
                        Expanded(child: Text(d.title,style: TextStyle(fontWeight: FontWeight.w600,fontSize:15.0),),),
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