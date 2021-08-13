import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lasttime/model/task.dart';
import 'package:lasttime/service/date_format.dart';

class TaskDateTimeLogScreen extends StatelessWidget {
  TaskDateTimeLogScreen({required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    var log = task.timeStamps.reversed.toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(task.title),
        ),
        body: ListView.builder(
          itemCount: log.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title:
                  Text(MyDateFormat.dateFormat.format(log[index])),
                  trailing: Text(MyDateFormat.timeFormat.format(log[index])),
            );
          },
        ));
  }
}
