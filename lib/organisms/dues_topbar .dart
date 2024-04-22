import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/pages/dues/invoices.dart';
import 'package:cerebro_mobile/pages/dues/mydues_dashboard.dart';

import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import '../atoms/navigation_drawer.dart';

class DuesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          appBar: CerebroAppBar(title: ("ABC School of Cavite")),
          drawer: CerebroNavigationDrawer(),
          body: Column(
            children: <Widget>[
              TabBar(
                indicatorColor: cerebroBlue200,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: cerebroBlue200),  //For Selected tab
              unselectedLabelStyle: TextStyle(color: cerebroBlue200), //For Un-selected Tab
                tabs: [
                  Tab(text: 'Assessments'),
                  Tab(text: 'Invoices'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                   MyDues1(),
                    Invoices(),
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