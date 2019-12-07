import 'package:flutter/material.dart';
import 'package:todo_app/model/product.dart';
import 'package:todo_app/components/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuyNow extends StatefulWidget {
  final Product product;
  final Function addToCar ;
  final int quantity;
  final double price;
   final double total;
  const BuyNow({Key key, this.product, this.addToCar, this.quantity, this.price, this.total}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BuyNowState();
}

class BuyNowState extends State<BuyNow> {

int _quantity;
double _price;
double _total;

  @override
  Widget build(BuildContext context) {

  _quantity = widget.quantity;
  _price = widget.price;
  _total = widget.total;


  return Container
  (
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
                              _quantity == 1 ?  1 : _quantity--;
                              double _total = widget.product.price * _quantity;
                              _total  = num.parse(_total.toStringAsFixed(2));
                              widget.product.quantity = _quantity;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(_quantity.toString(),),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              _quantity++;
                              double _total = widget.product.price * _quantity;
                              _total = num.parse(_total.toStringAsFixed(2));
                              widget.product.quantity = _quantity;
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
                      Text("\$ ${_total.toString()}  ",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600)),
                      RaisedButton(
                        color: Colors.deepOrange,
                        onPressed: (){
                          widget.addToCar(widget.product);                        },
                          child: Text("ADD TO CART",style: TextStyle(color: Colors.white),),
                      )
                    ],
                    ),

                  ],
              )
          );

}
}
