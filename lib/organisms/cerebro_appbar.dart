import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';

class CerebroAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CerebroAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => Size.fromHeight(92); // Height set to 92

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu, color: cerebroWhite, size: 40), // Hamburger menu icon
        onPressed: () {}, // Handle menu opening logic here
      ),
      title: Row( // Use Row to position title and leading together
        children: [
          Text(
            title,
            style: poppinsH5.copyWith(
              color: cerebroWhite,
            ),
          ),
        ],
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(0, 84, 166, 1), Color.fromRGBO(54, 116, 175, 1)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
      actions: [
        TextButton( // Use TextButton instead of IconButton
          onPressed: () {}, // Handle profile actions here
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40, // Adjust width as needed
              height: 40, // Adjust height as needed
              clipBehavior: Clip.antiAlias, // Optional: improve image rendering
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
        // Include any additional actions
      ],
      toolbarHeight: 92,
    );
  }
}
