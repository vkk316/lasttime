import 'package:flutter/material.dart';
import 'package:lasttime/model/task.dart';

class TaskForm extends StatefulWidget {
  TaskForm({Key? key}) : super(key: key);

  @override
  TaskFormState createState() => TaskFormState();
}

class TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _taskNameController = TextEditingController();

  String dropdownValue = Task.categories[0];

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _taskNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: "Task name",
              ),
            ),
            Container(
              width: 250,
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: Theme.of(context).accentColor,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: Task.categories
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ));
  }

  Task getTask() {
    return Task(
        title: _taskNameController.text,
        timeStamps: [],
        categoryID:
            Task.categories.indexWhere((element) => element == dropdownValue));
  }
}
