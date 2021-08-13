import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lasttime/model/task.dart';
import 'package:lasttime/screen/task_datetime_log_screen.dart';
import 'package:lasttime/service/date_format.dart';
import 'package:lasttime/service/task_services.dart';

class TaskCard extends StatelessWidget {
  TaskCard({required this.task, required this.callback})
      : _service = TaskService();
  final Task task;
  final TaskService _service;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () => onTabCard(task, context),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            Task.categories[task.categoryID],
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(20)),
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    task.timeStamps.isEmpty
                        ? Text('No date')
                        : Text(MyDateFormat.dateFormat.format(task.timeStamps.last)),
                    task.timeStamps.isEmpty
                        ? Text('No time')
                        : Text(MyDateFormat.timeFormat.format(task.timeStamps.last))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTabCard(Task task, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          task.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Material(
                        child: IconButton(
                            iconSize: 100,
                            onPressed: () {
                              _service.addNewTimeRecord(task);
                              Navigator.pop(context);
                              callback();
                            },
                            icon: Icon(Icons.add_task_outlined)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).canvasColor),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TaskDateTimeLogScreen(task: task,)),
                            );

                          },
                          icon: Icon(Icons.history),
                          label: Text('History'))
                    ],
                  ),
                ),
                width: width * 0.5,
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(6)),
              ),
            ],
          );
        });
  }
}
