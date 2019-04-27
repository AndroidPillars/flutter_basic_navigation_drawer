import 'package:flutter/material.dart';
import 'package:flutter_basic_navigation_drawer/fifth_fragment.dart';
import 'package:flutter_basic_navigation_drawer/first_fragment.dart';
import 'package:flutter_basic_navigation_drawer/fourth_fragment.dart';
import 'package:flutter_basic_navigation_drawer/second_fragment.dart';
import 'package:flutter_basic_navigation_drawer/third_fragment.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
            //Setting theme color
            primaryColor: Colors.red,
            //Setting button color
            accentColor: Colors.red,
            //Setting Text Theme
            textTheme: TextTheme(
              //Setting the body1 Text Color
              body1: TextStyle(
                color: Colors.black
              )
            )

      ),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyApp> {
  int currentIndex = 1;
//Getting Current Fragment
  Widget getCurrentFragment() {
    switch (currentIndex) {
      case 1:
        return FirstFragment();
        break;
      case 2:
        return SecondFragment();
        break;
      case 3:
        return ThirdFragment();
        break;
      case 4:
        return FourthFragment();
        break;
      case 5:
        return FifthFragment();
        break;
    }
  }

//Setting the Index
  setCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
    //Navigating the item
    Navigator.of(context).pop();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Setting the Navigation Drawer
      drawer: Drawer(
        //Setting Column Widget
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 40.0, left: 10.0),
              color: Colors.red,
              //Setting the width match parent
              width: double.infinity,
              height: 250.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Icon(Icons.account_circle, size: 80.0, color: Colors.white),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Android Pillars',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  Text('gowthamandro@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 15.0))
                ],
              ),
            ),
            //For Setting List Item
            ListTile(
              selected: currentIndex == 1 ? true : false,
              onTap: () {
                setCurrentIndex(1);
              },
              leading: Icon(Icons.add_shopping_cart),
              title: Text('Item 1'),
            ),
            ListTile(
              selected: currentIndex == 2 ? true : false,
              onTap: () {
                setCurrentIndex(2);
              },
              leading: Icon(Icons.add_to_home_screen),
              title: Text('Item 2'),
            ),
            ListTile(
              selected: currentIndex == 3 ? true : false,
              onTap: () {
                setCurrentIndex(3);
              },
              leading: Icon(Icons.add_to_photos),
              title: Text('Item 3'),
            ),
            ListTile(
              selected: currentIndex == 4 ? true : false,
              onTap: () {
                setCurrentIndex(4);
              },
              leading: Icon(Icons.album),
              title: Text('Item 4'),
            ),
            ListTile(
              selected: currentIndex == 5 ? true : false,
              onTap: () {
                setCurrentIndex(5);
              },
              leading: Icon(Icons.bluetooth_audio),
              title: Text('Item 5'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Navigation Drawer'),
      ),
      body: getCurrentFragment(),
    );
  }
}
