import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app_dn/constants/text_styles.dart';
import 'package:my_app_dn/data/1th_tab_model/1th_model.dart';
import 'package:my_app_dn/server/date_time_service.dart';
import 'package:my_app_dn/server/store_sevice.dart';

import '../../../constants/app_text.dart';
import '../../text_field/text_field.dart';

class TaskPage extends StatelessWidget {
  TaskPage({Key? key}) : super(key: key);

  final task = TextEditingController();
  final dateTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          AppTexts.NPl,
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
            child: Text(AppTexts.Pl, style: AppTextStyle.FT22),
          ),
          TtextField(
            controller: task,
            hintText: AppTexts.Tk,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20),
            child: Text(
              AppTexts.Tme,
              style: AppTextStyle.FT22,
            ),
          ),
          TtextField(
            controller: dateTime,
            hintText: AppTexts.Tm,
            focusNode: FocusNode(),
            onTap: () async {
              await DateTimeService.showDateTimePicker(
                context,
                (value) =>
                    dateTime.text = DateFormat(" d MMM , y").format(value),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final toptom = Toptom(
            task: task.text,
          );
          await StoreService().saveProduct(toptom);
          // ignore: use_build_context_synchronously
          Navigator.popUntil(context, (route) => route.isFirst);
        },
        child: const Text('Add'),
      ),
    );
  }
}
