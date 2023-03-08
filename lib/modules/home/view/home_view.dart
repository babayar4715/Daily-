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
            'Daily',
            style: AppTextStyle.TextFz30,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.menu),
            ),
          ],
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: AppColors.TabBarC,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.note_alt,
                    color: AppColors.TabBarC,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.star,
                    color: AppColors.TabBarC,
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
