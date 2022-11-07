import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/todo_app/page/todo_page.dart';
import 'package:provider_app/todo_app/provider/todo_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        home: const TodoPage(),
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
      ),
    );
  }
}
