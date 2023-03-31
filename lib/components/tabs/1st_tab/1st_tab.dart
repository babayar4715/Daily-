import 'package:flutter/material.dart';
import 'package:my_app_dn/components/tabs/1st_tab/task_page.dart';

class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskPage(),
            ),
          );
        },
        child: const Text(
          "add",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
