import 'package:flutter/material.dart';
import 'package:flutter_web/constants/page_titles.dart';
import 'package:flutter_web/widgets/app_scaffold.dart';

class DashBoardPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.dashboard,
      body: Center(
        child: Text('Working on dashboards'),
      ),
    );
  }

}