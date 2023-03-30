import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../text_field/text_field.dart';

class TaskPage extends StatelessWidget {
  TaskPage({Key? key}) : super(key: key);

  final task = TextEditingController();
  final datetime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Task',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'What task you have planned for ...',
              style: TextStyle(fontSize: 22),
            ),
          ),
          TtextField(
            controller: task,
            hintText: 'Here type new task ...',
          ),
          const SizedBox(
            height: 30,
          ),
          TtextField(
            controller: datetime,
            hintText: 'Time ',
          ),
        ],
      ),
    );
  }
}
