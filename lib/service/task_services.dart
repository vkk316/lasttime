import 'package:hive/hive.dart';
import 'package:lasttime/boxes.dart';
import 'package:lasttime/model/task.dart';

class TaskService {
  TaskService() : box = Boxes.getTasks();
  final Box<Task> box;

  void addTask(String title, List<DateTime> times, int catID) async {
    final transaction =
        Task(title: title, timeStamps: times, categoryID: catID);
    box.add(transaction);
  }

  void editTask(Task oldTask,String title, List<DateTime> times,int catID){
    oldTask.title = 
  }
}
