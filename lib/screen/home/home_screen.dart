import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inkapharma/common/app_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inkapharma/common/shared_preferences.dart';
import 'package:inkapharma/model/UserProfile.dart';
import 'package:inkapharma/pages/welcome_page.dart';
import 'package:inkapharma/screen/messages/messaging_page.dart';
import 'package:inkapharma/screen/product/cart.dart';
import 'package:inkapharma/auth.dart';
import 'package:inkapharma/screen/home/home_screen_page.dart';
import 'package:inkapharma/screen/product/product_page.dart';

class HomeScreen extends StatefulWidget{
  static const String id = 'home_page';
  @override
  State<StatefulWidget> createState()=> HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> 

{
  String _homeText;
  Widget content = HomeScreenPage();
  var _currentIndex = 0;
  int total = 0;
  UserProfile currentUser;
  
  @override
  initState() {
    super.initState();
    getUserProfile();
  }

 void  getCarList( ) {
     final productFuture = productRepository.getCount();
     productFuture.then((count) {
       setState(() {
        total  = count;
       });
     });
   }
  
  getUserProfile() async{
    final myProfile = await read('currentUser');
    print(myProfile);
    final temp = UserProfile.fromJson(json.decode(myProfile));
    setState(() {
        currentUser  = temp;
       });
  }

  @override
  Widget build(BuildContext context){
    getCarList();
    return  Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(currentUser.email),
              accountName: Text(currentUser.username),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black38,
                backgroundImage: NetworkImage(currentUser.picture) 
            )
            ),
          ],
        )
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppConstants.preferredSize),
        child: AppBar(
          brightness: Brightness.dark,
          centerTitle: true,
          title: Text( 
            _homeText !=null?_homeText:AppConstants.appBarTitle,
            style: TextStyle(fontSize: AppConstants.fontSize,fontWeight: FontWeight.bold,decoration: TextDecoration.none),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(FontAwesomeIcons.userCog, size: AppConstants.iconSize),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: <Widget>[
            InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(FontAwesomeIcons.signInAlt,size: AppConstants.iconSize, color: Colors.white),
              ),
              onTap: onLogout,
            ),  
            Container(
                  margin: const EdgeInsets.all(15.0),
                  width: 1,
                  height: 1,
                  child: Text((total > 0) ? total.toString() : "",
                                textAlign:TextAlign.center
                                ,style: TextStyle(fontSize:18.0,color: Colors.redAccent,fontWeight:FontWeight.bold))
              )
           ,Padding(
                padding: EdgeInsets.only(right:5.0),
                child: InkResponse(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                  },
                  child: Icon(Icons.shopping_cart),
                ),
              )
            ,          
          ],
        ),
      ),
      body:  content,
      bottomNavigationBar: _indexBottom()
    );
  }

  Widget _indexBottom() => BottomNavigationBar(
        currentIndex: _currentIndex,  
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.graduationCap),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.productHunt),
            title: Text('Products'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.facebookMessenger),
            title: Text('Messages'),
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (_currentIndex) {
              case 0:
                content = HomeScreenPage();
                break;
              case 1:
                content = ProductListPage();
                break;
              case 2:
                content = MessagingPage();
                break;               
            }
          });
        },
      );

  void onLogout() async{
    print("Notify logout");
    var authStateProvider = new AuthStateProvider();
    authStateProvider.notify(AuthState.LOGGED_OUT);
    Navigator.pushNamed(context, WelcomePage.id);
  }



}