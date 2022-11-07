import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_app/todo_app/model/todo_model.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> _task = [];

  UnmodifiableListView<TodoModel> get allTask => UnmodifiableListView(_task);

  void addTask(String task) {
    _task.add(TodoModel(todoTitle: task, completed: false));
    notifyListeners();
  }

  void toggleTask(TodoModel task) {
    final taskIndex = _task.indexOf(task);
    _task[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTask(TodoModel task) {
    _task.remove(task);
    notifyListeners();
  }


}
