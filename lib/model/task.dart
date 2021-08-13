class Task {

  Task({required this.title, required this.timeStamp, required this.categoryID});
  final String title;
  final DateTime timeStamp;
  final int categoryID;

  static const Map<int, String> categories = {0:'Garden', 1:'Cooking', 2:'Vehicle', 3:'Entertainment', 4:'Learning'};
}
