
import 'package:cerebro_mobile/pages/teacher/profile_settings/teacherprofile_screen.dart';
import 'package:flutter/material.dart';

class TeacherAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const TeacherAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => Size.fromHeight(92);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white, size: 40),
        onPressed: () {
          // Open the navigation drawer using Scaffold.of(context).openDrawer()
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Text(title,
          style: TextStyle(color: Colors.white)), // White title text
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 84, 166, 1),
              Color.fromRGBO(54, 116, 175, 1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TeacherProfileScreen()));
          }, // Handle profile actions here
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              height: 40,
              clipBehavior: Clip.antiAlias, // Improve image rendering
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/pfp.png'),
                  fit: BoxFit.cover, // Adjust fit as needed
                ),
              ),
            ),
          ),
        ),
      ],
      toolbarHeight: 92,
    );
  }
}
