import 'package:flutter/material.dart';

class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text(
            'There are we would be write just a to do list that we can there write our list of tasks then delete it'),
      ),
    );
  }
}
