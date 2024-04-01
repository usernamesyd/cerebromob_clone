import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/pages/admission/admission-enrollment_page.dart';
import 'package:cerebro_mobile/pages/admission/school_requirements_page.dart';
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
