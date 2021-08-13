import 'package:hive/hive.dart';
import 'package:lasttime/boxes.dart';
import 'package:lasttime/model/task.dart';

class TaskService {
  TaskService() : box = Boxes.getTasks();
  final Box<Task> box;

  List<Task> get getTask => box.values.toList(); 

  void addTask(String title, List<DateTime> times, int catID) async {
    final transaction =
        Task(title: title, timeStamps: times, categoryID: catID);
    box.add(transaction);
  }

  void editTask(Task task,String title, List<DateTime> times,int catID){
    task.title = title;
    task.timeStamps = times;
    task.categoryID = catID;

    task.save();
  }

  void addNewTimeRecord(Task task){
    task.timeStamps.add(DateTime.now());
    task.save();
  }

  void deleteTask(Task task){
    task.delete();
  }
}
