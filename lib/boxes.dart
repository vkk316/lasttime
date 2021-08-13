import 'package:hive/hive.dart';
import 'package:lasttime/model/task.dart';

class Boxes {
  static Box<Task> getTasks() =>
      Hive.box<Task>('tasks');
}
