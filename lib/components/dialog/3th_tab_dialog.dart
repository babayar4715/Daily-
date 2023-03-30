import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text.dart';
import '../buttons/3th_tab_button.dart';

class DialogBax extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBax({
    Key? key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.bggCAl,
      content: SizedBox(
        height: 200,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                fillColor: Colors.red,
                border: OutlineInputBorder(),
                hintText: AppTexts.task,
              ),
            ),

            //  buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: AppTexts.Save, onPressed: onSave),
                const SizedBox(width: 8),

                // cancel button
                MyButton(text: AppTexts.Cancel, onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
