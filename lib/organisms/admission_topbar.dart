import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/pages/student/admission/admission-enrollment_page.dart';
import 'package:cerebro_mobile/pages/student/admission/school_requirements_page.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import '../atoms/navigation_drawer.dart';

class AdmissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          appBar: CerebroAppBar(title: ("Admission")),
          drawer: CerebroNavigationDrawer(),
          body: Column(
            children: <Widget>[
              TabBar(
                indicatorColor: cerebroBlue200,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: cerebroBlue200),  //For Selected tab
              unselectedLabelStyle: TextStyle(color: cerebroBlue200), //For Un-selected Tab
                tabs: [
                  Tab(text: 'School Requirements'),
                  Tab(text: 'Admission/Enrollment'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SchoolRequirementsPage(),
                    AdmissionEnrollmentPage(),
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