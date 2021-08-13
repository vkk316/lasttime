import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lasttime/model/task.dart';
import 'package:lasttime/service/task_services.dart';
import 'package:lasttime/widget/category_tiles.dart';
import 'package:lasttime/widget/task_card.dart';
import 'package:lasttime/widget/task_form.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TaskService _service;

  _MainScreenState() : _service = new TaskService();
  GlobalKey<TaskFormState> _formWidgetKey = GlobalKey();

  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    refreshTasks();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LASTTIME'),
        actions: [
          IconButton(
              onPressed: _onPressFilterButton, icon: Icon(Icons.filter_alt)),
          IconButton(onPressed: () => print("HI"), icon: Icon(Icons.more_vert))
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskCard(
            task: tasks[index],
            callback: () => refreshTasks(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onPressAddTaskButton,
      ),
    );
  }

  void _onPressFilterButton() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          var cat = Task.categories;
          return ListView.builder(
            itemCount: cat.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  setState(() {
                    _service.filterTasks(index);
                    refreshTasks();
                  });
                  Navigator.pop(context);
                },
                title: Text(cat[index]),
              );
            },
          );
        });
  }

  void _onPressAddTaskButton() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add task'),
            content: TaskForm(
              key: _formWidgetKey,
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close')),
              TextButton(
                onPressed: () {
                  print('Add');
                  var a = _formWidgetKey.currentState!.getTask();
                  _service.addTask(a.title, a.timeStamps, a.categoryID);
                  Navigator.pop(context);
                  refreshTasks();
                },
                child: Text('Add'),
              )
            ],
          );
        });
  }

  void refreshTasks() {
    setState(() {
      tasks = _service.getTask;
    });
  }
}
