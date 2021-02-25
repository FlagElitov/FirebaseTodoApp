import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TODOCreate extends StatelessWidget {
  TODOCreate({Key key}) : super(key: key);

  final collection = Firestore.instance.collection('tasks');
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create a task')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            // Opens the keyboard automatically
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(labelText: 'Enter name for your task'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () async {
          if (controller.text != '') {
            await collection.add({'name': controller.text, 'completed': false});
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
