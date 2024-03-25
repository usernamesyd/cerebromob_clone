import 'package:cerebro_mobile/atoms/navigation_drawer.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userName = 'Rafaela Aquino';
  final String userRole = 'Student';
  final String profileImagePath = 'assets/images/profilepic.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CerebroAppBar(
        title: ("ABC School of Cavite"),
      ),
      drawer: CerebroNavigationDrawer(),
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
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color:cerebroBlue300),
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
                            // Handle change password button press
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
}