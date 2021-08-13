import 'package:hive/hive.dart';
import 'package:lasttime/boxes.dart';
import 'package:lasttime/model/task.dart';

class TaskService {

  static final TaskService _instance = TaskService._internal();

  factory TaskService() {
    return _instance;
  }

  TaskService._internal(): _box = Boxes.getTasks();

  final Box<Task> _box;
  late List<Task> _data = _box.values.toList();
  late List<Task> _listTask = _data;

  List<Task> get getTask => _listTask;

  void addTask(String title, List<DateTime> times, int catID) async {
    final transaction =
        Task(title: title, timeStamps: times, categoryID: catID);
    _box.add(transaction);
  }

  void editTask(Task task, String title, List<DateTime> times, int catID) {
    task.title = title;
    task.timeStamps = times;
    task.categoryID = catID;

    task.save();
  }

  void addNewTimeRecord(Task task) {
    task.timeStamps.add(DateTime.now());
    task.save();
  }

  void deleteTask(Task task) {
    task.delete();
  }

  //Filtering data
  void filterTasks(int catID) {
    _listTask = _data.where((element) => element.categoryID == catID).toList();
  }
}
