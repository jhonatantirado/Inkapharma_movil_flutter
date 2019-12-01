import 'package:flutter/material.dart';
import 'package:todo_app/infraestructure/Sqflite_UserRepository.dart';
import 'package:todo_app/data/database_helper.dart';
import 'package:todo_app/model/user.dart';
import 'package:todo_app/screen/product/product_page_detail.dart';
import 'package:todo_app/model/choice.dart';

//import 'package:flutter_rating/flutter_rating.dart';


class ProductListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductListPageState();
}

class ProductListPageState extends State<ProductListPage> {

  SqfliteUserRepository userRepository = SqfliteUserRepository(DatabaseHelper.get);
  List<User> users;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final title = "Grid List";

    return MaterialApp(
      debugShowCheckedModeBanner: false
      //,title: title,
      ,home: Scaffold(
        //drawer: Drawer(),
        appBar: MyCustomAppBar(height: 70,),//150
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(choices.length, (index) {
              return Center(
                child: ChoiceCard(choice: choices[index]),
              );
           }
          )
        )
      )
    );
  }

}

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red[300],
          child: Padding(
            padding: EdgeInsets.all(1),//30
            child: AppBar(
                    title: Container(
                      color: Colors.white,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Product",
                          contentPadding: EdgeInsets.all(4),//10
                        ),
                      ),
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () => null,
                      ),
                    ],
                  ) ,
          ),
        ),
      ],
    );
  }
  
 @override
  Size get preferredSize => Size.fromHeight(height);
}


const List<Choice> choices = const <Choice>[
  const Choice( quantity: 1, price: 10.0, title: 'Product1', icon: Icons.directions_car, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/c/accu-chek-instant-s-test-strips-50-s-835774208.jpg"),
  const Choice( quantity: 1,price: 5.0, title: 'Product2', icon: Icons.directions_bike, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/c/accu-chek-active-test-strip-50-s-15580684.jpg"),
  const Choice( quantity: 1,price: 10.0,title: 'Product3', icon: Icons.directions_boat, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/c/accusure-simple-gluco-test-strip-50s--857449581.jpg"),
  const Choice( quantity: 1,price: 5.05,title: 'Product4', icon: Icons.directions_bus, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/c/accu-chek-instant-s-blood-glucose-monitor-1-s_812638_556.jpg"),
  const Choice( quantity: 1,price: 10.00,title: 'Product5', icon: Icons.directions_railway, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/c/accusure-simple-gluco-meter-with-25-strips--857447929.jpg"),
  const Choice( quantity: 1,price: 5.00,title: 'Product6', icon: Icons.directions_walk, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/e/n/ensure-diabetes-care-vanilla-powder-400gm-413072622.jpg"),
  const Choice( quantity: 1,price: 10.00,title: 'Product7', icon: Icons.directions_car, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/v/avalife-diabetes-support-tablets-60-s-828634372.jpg"),
  const Choice( quantity: 1,price: 5.00,title: 'Product8', icon: Icons.drafts, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/p/apollo-sugar-glucome-glucometer-glucome-strips-25s-pack-diabetes-foot-wear-voucher-worth-rupees-500-1-s-846888757.jpg"),
  const Choice( quantity: 1,price: 10.0,title: 'Product9', icon: Icons.dvr, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/a/l/allen-a08-diabetes-drops-30-ml-830953142.jpg"),
  const Choice( quantity: 1,price: 5.00,title: 'Product10', icon: Icons.copyright, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/o/m/omeo-diabetes-drops-30ml-828541222.jpg"),
  const Choice( quantity: 1,price: 10.20,title: 'Product11', icon: Icons.cloud_off, image: "https://buybestmeds.com/content/160x120/viagra.jpg"),
  const Choice( quantity: 1,price: 5.0,title: 'Product12', icon: Icons.directions_car, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/g/n/gnc-burn-caplet-60-s-813850403.jpg"),
  const Choice( quantity: 1,price: 5.0,title: 'Product13', icon: Icons.directions_bike, image: "https://ae01.alicdn.com/kf/H59d63c164b9c485abe078ef563fb23dde/2019-New-Mini-Hair-Straightener-Flat-Iron-Curling-Hair-Beard-Straightener-Comb-Hair-Crimper-Curling-Iron.jpg"),
  const Choice( quantity: 1,price: 10.00,title: 'Product14', icon: Icons.directions_boat, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/d/a/dabur-honey-50-gm-12729360.jpg"),
  const Choice( quantity: 1,price: 5.00,title: 'Product15', icon: Icons.directions_bus, image: "https://www.netmeds.com/pub/media/catalog/product/cache/image/240x240/57453768b1c789093496adaa9e415a9d/s/r/srisri-tattva-amla-juice-1000ml-824343297.jpg"),
  /*const Choice( quantity: 1,title: 'Train', icon: Icons.directions_railway),
  const Choice( quantity: 1,title: 'Walk', icon: Icons.directions_walk),
  const Choice( quantity: 1,title: 'Car', icon: Icons.directions_car),
  const Choice( quantity: 1,title: 'Bicycle', icon: Icons.drafts),
  const Choice( quantity: 1,title: 'Boat', icon: Icons.dvr),
  const Choice( quantity: 1,title: 'Bus', icon: Icons.copyright),
  const Choice( quantity: 1,title: 'Train', icon: Icons.cloud_off),
  const Choice( quantity: 1,title: 'Car', icon: Icons.directions_car),
  const Choice( quantity: 1,title: 'Bicycle', icon: Icons.directions_bike),
  const Choice( quantity: 1,title: 'Boat', icon: Icons.directions_boat),
  const Choice( quantity: 1,title: 'Bus', icon: Icons.directions_bus),
  const Choice( quantity: 1,title: 'Train', icon: Icons.directions_railway),
  const Choice( quantity: 1,title: 'Walk', icon: Icons.directions_walk),
  const Choice( quantity: 1,title: 'Car', icon: Icons.directions_car),
  const Choice( quantity: 1,title: 'Bicycle', icon: Icons.drafts),
  const Choice( quantity: 1,title: 'Boat', icon: Icons.dvr),
  const Choice( quantity: 1,title: 'Bus', icon: Icons.copyright),
  const Choice( quantity: 1,title: 'Train', icon: Icons.cloud_off),*/
];


class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    //final TextStyle textStyle = Theme.of(context).textTheme.display1;
        return Card(
          color: Colors.white,
          child: Center(child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /*Expanded(
                  child: Container(child: Image.network(  choice.image, fit: BoxFit.contain,),)),
                Text(choice.title, style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.0)),*/

                  Container(
                          height: 100.0,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: 
                            
                            GestureDetector(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: Image.network(choice.image,fit: BoxFit.contain,),
                                  ),
                                ),
                                /*Container(
                                  //child: data[index].fav ? Icon(Icons.favorite,size: 20.0,color: Colors.red,) : Icon(Icons.favorite_border,size: 20.0,),
                                )*/
                              ],                              
                            )
                            ,onTap: (){
                                 Navigator.push(context,MaterialPageRoute(builder: (context)=> Product_Detail( detail: choice )));
                              },
                            )
                          ),
                        ),
                        
                        SizedBox(height: 10.0,),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("${choice.title}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.0),),
                        ),
                        Padding(    
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              /*new StarRating(
                                  size: 15.0,
                                  rating: 10,
                                  color: Colors.orange,
                                  borderColor: Colors.grey,
                                  starCount: 5
                              ),*/
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text("\$${choice.price.toString()}",style: TextStyle(fontWeight: FontWeight.w500),),
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

