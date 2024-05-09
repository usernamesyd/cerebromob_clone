import 'package:cerebro_mobile/pages/teacher/dashboard/dashboard.dart';
import 'package:cerebro_mobile/pages/teacher/myclasses/myclass_dashpage.dart';
import 'package:cerebro_mobile/pages/teacher/profile/teacher_edit_profile.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class TeacherNavigationDrawer extends StatelessWidget {
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
                      MaterialPageRoute(builder: (context) => TeachersDashboardPage())); // Navigate to Dashboard
                },
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text('Profile', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TeacherEditProfile())); // Navigate to Dashboard
                },
              ),
              ListTile(
                leading: Icon(Icons.computer_rounded, color: Colors.white),
                title: Text('My Classes', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ClassAcadPage())); // Navigate to My Classes Page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
