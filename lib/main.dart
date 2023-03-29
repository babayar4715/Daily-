import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'main-app/app.dart';
import 'components/tabs/3th_tab.dart';
import 'constants/app_text.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  //  open the box
  var box = await Hive.openBox(AppTexts.Mybox);

  runApp(const MyApp());
}
