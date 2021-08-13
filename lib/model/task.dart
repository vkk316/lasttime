import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject{

  Task({required this.title, required this.timeStamps, required this.categoryID});
  
  @HiveField(0)
  late String title;
  
  @HiveField(1)
  late List<DateTime> timeStamps;

  @HiveField(2)
  late int categoryID;

  static const List<String> categories = ['Garden', 'Food', 'Vehicle', 'Entertainment', 'Learning'];
}
