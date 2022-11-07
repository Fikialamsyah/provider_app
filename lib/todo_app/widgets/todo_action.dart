import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/todo_app/provider/todo_provider.dart';

class TodoAction extends StatelessWidget {
  const TodoAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TodoProvider>(context);

    return ListView.builder(
      itemCount: task.allTask.length,
      itemBuilder: (context, index) => ListTile(
        leading: Checkbox(
          value: task.allTask[index].completed,
          onChanged: ((_) => task.toggleTask(task.allTask[index])),
        ),
        title: Text(task.allTask[index].todoTitle!),
        trailing: IconButton(
          onPressed: () => task.deleteTask(task.allTask[index]),
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
