import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/todo_app/provider/todo_provider.dart';
import 'package:provider_app/todo_app/widgets/todo_action.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _textFieldController = TextEditingController();
  String newTask = '';

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _submit() {
    Provider.of<TodoProvider>(context, listen: false).addTask(newTask);
    Navigator.pop(context);
    _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showAddTextDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Add New Task'),
              content: TextField(
                autofocus: true,
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: 'Add New Task'),
                onSubmitted: (_) => _submit(),
              ),
              actions: [
                Center(
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Submit'),
                  ),
                ),
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App Provider'),
      ),
      body: TodoAction(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTextDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
