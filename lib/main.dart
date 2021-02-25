import 'package:FirebaseTodoApp/screens/create/create_task.dart';
import 'package:FirebaseTodoApp/screens/list/tasks_list.dart';
import 'package:FirebaseTodoApp/screens/login/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(TODO());

class TODO extends StatelessWidget {
  const TODO({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO app',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/list': (context) => TODOList(),
        '/create': (context) => TODOCreate(),
      },
    );
  }
}
