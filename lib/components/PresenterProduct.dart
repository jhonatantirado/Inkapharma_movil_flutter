import 'package:flutter/material.dart';
import 'package:todo_app/model/product.dart';
import 'package:todo_app/components/BuildDot.dart';
 
class PresenterProduct extends StatefulWidget {
  final Product product;
  final PageController control;
  const PresenterProduct({Key key, this.product, this.control}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PresenterProductState();
}

class PresenterProductState extends State<PresenterProduct> {

  int _active = 0;

  @override
  Widget build(BuildContext context) {
  return Container(
                      height: 260.0,
                      padding: EdgeInsets.only(top: 10.0),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 180.0,
                            child: PageView(
                              controller: widget.control,
                              onPageChanged: (index){                                
                                setState(() {
                                  _active = index;
                                });
                              },
                              children: <Widget>[
                                Image.network(widget.product.imageUrl,height: 150.0,)
                                , Icon(Icons.hearing, size: 90.0, color: Colors.red) 
                                ,Icon(Icons.tune, size: 90.0, color: Colors.red) 
                                ,Icon(Icons.accessible, size: 90.0, color: Colors.red)
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              BuildDot(_active, 0),
                              BuildDot(_active,1),
                              BuildDot(_active,2),
                              BuildDot(_active,3)
                            ],
                          ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Price  ",style: TextStyle(fontSize: 20.00,fontWeight: FontWeight.w400)),      
                              Text("\$${widget.product.price.toString()}",style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.w600)),      
                            ],
                          ),                        
                        ],
                      ),
                    );
  }
}


  
  