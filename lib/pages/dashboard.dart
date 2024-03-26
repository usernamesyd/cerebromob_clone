import 'package:cerebro_mobile/atoms/navigation_drawer.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/organisms/announcement_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}); // Fixed super.key to Key? key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CerebroAppBar(title: "Dashboard"),
      drawer: CerebroNavigationDrawer(),
      body: Container(
        color: cerebroWhite,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: AnnouncementPane(),
      ),
    );
  }
}

class AnnouncementPane extends StatefulWidget {
  const AnnouncementPane({Key? key}); // Fixed super.key to Key? key

  @override
  State<AnnouncementPane> createState() => _AnnouncementPane();
}

class _AnnouncementPane extends State<AnnouncementPane> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Announcement',
            style: poppinsH4.copyWith(
              color: Colors.black,
            ),
          ),
          Expanded( 
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
               AnnouncementCard(
                  adminName: 'ABC School Admin',
                  announcementTitle: 'Chinese New Year',
                  announcementDateTime: 'October 23, 2024 01:14:28 AM',
                  announcementDetails:
                      "Get ready for an exciting year ahead! Classes for the new academic year will begin on August 28th. We hope you had a fantastic break and are eager to dive into your studies. Remember to arrive on time and come prepared for an engaging first day. If you're new to our school, an orientation session will be held to familiarize you and your parents/guardians with our policies and resources. Look out for more details soon! Wishing you a successful and fulfilling academic year!",
                )
              ],
            ),
          ),
        ], 
      ),
    );
  }
}
