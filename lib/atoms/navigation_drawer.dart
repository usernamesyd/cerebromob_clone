import 'package:cerebro_mobile/organisms/admission_topbar.dart';
import 'package:cerebro_mobile/organisms/dues_topbar%20.dart';
import 'package:cerebro_mobile/organisms/request_topbar.dart';
import 'package:cerebro_mobile/pages/student/classes/myClass1.dart';
import 'package:cerebro_mobile/pages/student/dashboard/dashboard.dart';
import 'package:cerebro_mobile/pages/student/grades/mygrades1.dart';
import 'package:cerebro_mobile/pages/student/profile/edit_profile.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class CerebroNavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65, // Adjust the width as needed
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                cerebroBlue200, Color.fromRGBO(102, 143, 183, 1)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.only(left:20),
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      cerebroBlue200, Color.fromRGBO(102, 143, 183, 1)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/SchoolLogo.png'),
                      radius: 30,
                    ),
                    SizedBox(width: 20),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ABC School',
                            style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'of Cavite',
                            style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard, color: Colors.white),
                title: Text('Dashboard', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardPage())); // Navigate to Dashboard
                },
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text('Profile', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile())); // Navigate to Profile
                },
              ),
              ListTile(
                leading: Icon(Icons.school, color: Colors.white),
                title: Text('Admission', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdmissionPage())); // Navigate to Admission
                },
              ),
              ListTile(
                leading: Icon(Icons.list, color: Colors.white),
                title: Text('Classes', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyClassPage())); // Navigate to Classes
                },
              ),
              ListTile(
                leading: Icon(Icons.money, color: Colors.white),
                title: Text('Dues', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DuesPage())); // Navigate to Dues
                },
              ),
              ListTile(
                leading: Icon(Icons.assignment, color: Colors.white),
                title: Text('Grades', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => myGradesPage1())); // Navigate to Grades
                },
              ),
              ListTile(
                leading: Icon(Icons.request_quote, color: Colors.white),
                title: Text('Requests', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RequestPage())); // Navigate to Requests
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
