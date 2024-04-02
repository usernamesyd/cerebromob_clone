import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/pages/request_page/request_form.dart';
import 'package:cerebro_mobile/pages/request_page/request_record.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import '../atoms/navigation_drawer.dart';

class RequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          appBar: CerebroAppBar(title: ("Requests")),
          drawer: CerebroNavigationDrawer(),
          body: Column(
            children: <Widget>[
              TabBar(
                indicatorColor: cerebroBlue100,
                labelColor: cerebroBlue100,
                tabs: [
                  Tab(text: 'School Requirements'),
                  Tab(text: 'Admission/Enrollment'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                   RequestForm(),
                    RequestRecordPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}