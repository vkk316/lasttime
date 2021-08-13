class Task {

  Task({required this.title, required this.timeStamp, required this.categoryID});
  final String title;
  final DateTime timeStamp;
  final int categoryID;

  static const List<String> categories = ['Garden', 'Cooking', 'Vehicle', 'Entertainment', 'Learning'];
}
