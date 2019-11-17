import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:flutter/material.dart";
import "dart:async";
import 'package:todo_app/model/choice.dart';
import 'package:todo_app/components/round_icon_button.dart';

class Product_Detail extends StatefulWidget{

  static final String route = "Home-route";
  Choice detail;
  Product_Detail({this.detail});

  @override
  State<StatefulWidget> createState() { return Product_DetailState();}
}

class Product_DetailState extends State<Product_Detail>{


int quantity = 1;
double price;
double total;

@override
initState() {
  super.initState();
   price = widget.detail.price ;
    total = price * quantity;
   
}

  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PageController _controller;
  int active =0;

  Widget buildDot(int index,int num){
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
            color: (num == index ) ? Colors.black38 : Colors.grey[200],
            shape: BoxShape.circle
        ),
      ),
    );
  }

  /*showSnak(bool flag,String name){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(flag ? "${name} added in favourite list" : "${name} removed from favourite list"),
          duration: Duration(seconds: 2),
        ));
  }*/

  /*showCartSnak(String msg,bool flag){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(msg,style: TextStyle(color: Colors.white),),
          backgroundColor: (flag) ? Colors.green : Colors.red[500] ,
          duration: Duration(seconds: 2),
        ));
  }*/

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(widget.detail.title),
            elevation: 0.0,
          ),
          body: Container(
            child: ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 260.0,
                      padding: EdgeInsets.only(top: 10.0),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 180.0,
                            child: PageView(
                              controller: _controller,
                              onPageChanged: (index){
                                print(index);
                                setState(() {
                                  active = index;
                                });
                              },
                              children: <Widget>[
                                Image.network(widget.detail.image,height: 150.0,)
                                , Icon(Icons.hearing, size: 90.0, color: Colors.red) 
                                ,Icon(Icons.tune, size: 90.0, color: Colors.red) 
                                ,Icon(Icons.accessible, size: 90.0, color: Colors.red)
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              buildDot(active,0),
                              buildDot(active,1),
                              buildDot(active,2),
                              buildDot(active,3)
                            ],
                          ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Price  ",style: TextStyle(fontSize: 20.00,fontWeight: FontWeight.w400)),      
                              Text("\$${price.toString()}",style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.w600)),      
                            ],
                          ),
                        /*Container(
                        width: 100.0,
                        child: Text("Price",style: TextStyle(fontSize: 12.0,color: Colors.grey),),
                         ),
                        Text("\$${widget.detail.price.toString()}",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w600)),
                        */
                        ],
                      ),
                    ),
                   
                  ],
                ),
                
              ],
            ),
          ),
          bottomNavigationBar: Container(
              margin: EdgeInsets.only(bottom: 10.0),
              height: 110.0,
              decoration: BoxDecoration(
                  color: Colors.white12,
                  border: Border(
                      top: BorderSide(color: Colors.grey[300],width: 1.0)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              quantity == 1 ?  1 : quantity--;
                              total  = widget.detail.price * quantity;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(quantity.toString(),),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              quantity++;
                              total = widget.detail.price * quantity;
                            });
                          },
                        ),
                      ],
                    ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 120.0,
                        child: Text("Total Amount",style: TextStyle(fontSize:18.0,color: Colors.grey),),
                      ),
                      Text("\$ ${total.toString()}  ",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600)),
                      RaisedButton(
                        color: Colors.deepOrange,
                        onPressed: (){
                          //model.addCart(widget.detail);
                          Timer(Duration(milliseconds: 500), (){
                            //showCartSnak(model.cartMsg,model.success);
                          });
                        },
                        child: Text("ADD TO CART",style: TextStyle(color: Colors.white),),
                      )
                    ],
                    ),

                  ],
              )
          ),
        ),
    );
  }
}
