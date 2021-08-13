import 'package:flutter/material.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  //GlobalKey>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LASTTIME'), actions: [IconButton(onPressed: () => print("HI"), icon: Icon(Icons.search))],),
      body: Container()
    );
  }

}
