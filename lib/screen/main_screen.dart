import 'package:flutter/material.dart';
import 'package:lasttime/model/task.dart';
import 'package:lasttime/widget/category_tiles.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  //GlobalKey>
  //mock data
  List<Task> tasks = [
    Task(
        title: 'ล้างจาน',
        timeStamp: DateTime(2021, 8, 12, 14, 30),
        categoryID: 1),
    Task(
        title: 'ตัดหญ้า',
        timeStamp: DateTime(2021, 8, 12, 16, 30),
        categoryID: 0),
    Task(
        title: 'ปลูกฟ้าทะลายโจร',
        timeStamp: DateTime(2021, 8, 13, 8, 45),
        categoryID: 0),
    Task(
        title: 'ล้างรถ',
        timeStamp: DateTime(2021, 8, 13, 11, 10),
        categoryID: 2)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LASTTIME'),
          actions: [
            IconButton(
                onPressed: _onPressFilterButton, icon: Icon(Icons.filter_alt)),
            IconButton(
                onPressed: () => print("HI"), icon: Icon(Icons.more_vert))
          ],
        ),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text(tasks[index].title), );
          },
        ));
  }
  void _onPressFilterButton(){
    showModalBottomSheet(context: context, builder: (context){
      var cat = Task.categories;
      return ListView.builder(itemCount: cat.length,itemBuilder: (BuildContext context, int index) { return ListTile(title: Text(cat[index]),); },);
    });
  }
}
