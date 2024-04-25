import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/pages/student/dues/invoices.dart';
import 'package:cerebro_mobile/pages/student/dues/mydues_dashboard.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
            children: <Widget>[
              SizedBox(height: 16), // Add space between app bar and My Dues
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'My Dues',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 84, 166, 1),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TabBar(
                indicatorColor: cerebroBlue200,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: cerebroBlue200),  //For Selected tab
                unselectedLabelStyle: TextStyle(fontSize: 16, color: cerebroBlue200, fontWeight: FontWeight.normal), //For Un-selected Tab
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
