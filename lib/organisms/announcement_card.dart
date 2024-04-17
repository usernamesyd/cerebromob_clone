import 'package:flutter/material.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';

class AnnouncementCard extends StatefulWidget {
  final String adminName;
  final String announcementTitle;
  final String announcementDateTime;
  final String announcementDetails;

  AnnouncementCard({
    required this.adminName,
    required this.announcementTitle,
    required this.announcementDateTime,
    required this.announcementDetails,
  });

  @override
  _AnnouncementCardState createState() => _AnnouncementCardState();
}

class _AnnouncementCardState extends State<AnnouncementCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cerebroWhite,
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: cerebroWhite,
          borderRadius: BorderRadius.circular(10),
           border: Border.all(
                color: Color.fromARGB(255, 179, 177, 177),
                width: 1,
              ), 
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                alignment: Alignment.topLeft,
                width: 25,
                height: 25,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/pfp.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.adminName,
                      style: poppinsH6.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2),
                    Text(
                      widget.announcementTitle,
                      style: poppinsH6.copyWith(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.announcementDateTime,
                      style: poppinsH6.copyWith(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        widget.announcementDetails,
                        textAlign: TextAlign.justify,
                        style: poppinsH6.copyWith(
                            color: Colors.black,
                            fontSize: 10,
                            height: 1.5,
                            fontWeight: FontWeight.normal),
                        softWrap: true,
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
