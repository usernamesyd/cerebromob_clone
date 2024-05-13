import 'package:cerebro_mobile/atoms/teacher_navdrawer.dart';
import 'package:cerebro_mobile/organisms/teacher_appbar.dart';
import 'package:cerebro_mobile/pages/login/login_page.dart';
import 'package:cerebro_mobile/pages/teacher/profile_settings/teacherchange_profile.dart';
import 'package:cerebro_mobile/pages/teacher/profile_settings/teacherchangepassword_screen.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TeacherProfileScreen extends StatelessWidget {
  final String userName = 'Sofia Ramirez';
  final String userRole = 'Teacher';
  final String profileImagePath = 'assets/images/profile.png';
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TeacherAppBar(
        title: ("ABC School of Cavite"),
      ),
      drawer: TeacherNavigationDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage(profileImagePath),
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: cerebroBlue300),
                          ),
                          Text(userRole),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300.0,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: cerebroWhite,
                            backgroundColor: cerebroBlue200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {
                            // Handle change profile picture button press
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TeacherChangeProfile()));
                          },
                          icon: Icon(Icons.camera),
                          label: Text('Change Profile Picture'),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 300.0,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: cerebroWhite,
                            backgroundColor: cerebroBlue200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TeacherChangePasswordScreen()));
                          },
                          icon: Icon(Icons.lock),
                          label: Text('Change Password'),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 300.0,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: cerebroWhite,
                            backgroundColor: cerebroBlue200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {
                            // Handle log out button press
                            signOut(context);
                          },
                          icon: Icon(Icons.logout),
                          label: Text('Log Out'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signOut(BuildContext context) async { 
    await auth.signOut();
    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    );
  }
}
