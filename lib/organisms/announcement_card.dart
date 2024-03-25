import 'package:flutter/material.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';

class AnnouncementCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cerebroWhite,
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                alignment: Alignment.topLeft,
                width: 25, // Adjust width as needed
                height: 25, // Adjust height as needed
                clipBehavior: Clip.antiAlias,
                 decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/pfp.png'),
                    fit: BoxFit.cover, // Adjust fit as needed
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
                      'ABC School Admin',
                      style: poppinsH6.copyWith(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Chinese New Year',
                      style: poppinsH6.copyWith(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)
                    ),
                     SizedBox(height: 4),
                    Text(
                      'October 23, 2024 01:14:28 AM',
                      style: poppinsH6.copyWith(color: Colors.black, fontSize: 8, fontWeight: FontWeight.normal)
                    ),
                    SizedBox(height: 8), 
                    SizedBox(
                        width: double.maxFinite, 
                        child: Text(
                          "Get ready for an exciting year ahead! Classes for the new academic year will begin on August 28th. We hope you had a fantastic break and are eager to dive into your studies. Remember to arrive on time and come prepared for an engaging first day. If you're new to our school, an orientation session will be held to familiarize you and your parents/guardians with our policies and resources. Look out for more details soon! Wishing you a successful and fulfilling academic year!",
                          textAlign: TextAlign.justify,
                          style: poppinsH6.copyWith(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.normal
                          ),
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
