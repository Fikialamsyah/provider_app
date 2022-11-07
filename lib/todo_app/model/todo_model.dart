class TodoModel {
  String? todoTitle;
  bool? completed;

  TodoModel({this.todoTitle, this.completed});

  void toggleCompleted() {
    completed = !completed!;
  }
}
