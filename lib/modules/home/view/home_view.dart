import 'package:flutter/material.dart';
import '../../../components/components.dart';
import '../../../constants/constans_main.dart';
import '../../../constants/text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppTexts.Dl,
            style: AppTextStyle.TextFz30,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.menu),
            ),
          ],
        ),
        body: Column(
          children: const [
            TabBar(
              tabs: [
                Tab(
                  child: Text(
                    AppTexts.SCh,
                    style: AppTextStyle.FST,
                  ),
                ),
                Tab(
                  child: Text(
                    AppTexts.Nt,
                    style: AppTextStyle.FST,
                  ),
                ),
                Tab(
                  child: Text(
                    AppTexts.Habit,
                    style: AppTextStyle.FST,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  //1t tab
                  FirstTab(),

                  // 2nd tab
                  SecondTab(),

                  // 3th tab
                  ThirdTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
