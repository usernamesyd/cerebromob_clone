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
                AnnouncementCard(),
              ],
            ),
          ),
        ], 
      ),
    );
  }
}
