import 'package:cerebro_mobile/atoms/cerebro_icon_btn_class.dart';
import 'package:cerebro_mobile/atoms/navigation_drawer.dart';
import 'package:cerebro_mobile/pages/teacher/myclasses/classlist_page.dart';
import 'package:cerebro_mobile/pages/teacher/myclasses/grades_encoding.dart';
import 'package:cerebro_mobile/pages/teacher/myclasses/teacher_class_attendance_1.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/molecules/searchfield.dart';

class ClassCardsPage extends StatelessWidget {
  const ClassCardsPage({Key? key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CerebroAppBar(title: "My Classes"),
      drawer: CerebroNavigationDrawer(),
      body: SingleChildScrollView(
        child: ClassCardsPagePane(),
      ),
    );
  }
}

class ClassCardsPagePane extends StatefulWidget {
  const ClassCardsPagePane({Key? key});

  @override
  State<ClassCardsPagePane> createState() => _ClassCardsPagePane();
}

class _ClassCardsPagePane extends State<ClassCardsPagePane> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'GRADE 1',
                      style: poppinsH3.copyWith(
                        color: Colors.black87,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      '2023-2024',
                      style: poppinsParagraph.copyWith(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  CerebroSearchField(),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      ClassCard(),
                      ClassCard(),
                      ClassCard(),
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

class ClassCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: cerebroBlue300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Araling Panlipunan 1',
              style: poppinsParagraph.copyWith(
                fontWeight: FontWeight.bold,
                color: cerebroWhite,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: cerebroWhite, size: 16),
                    SizedBox(width: 8),
                    Text(
                      'Date:',
                      style: poppinsParagraph.copyWith(
                        color: cerebroWhite,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Thursday',
                      style: poppinsParagraph.copyWith(
                        color: cerebroWhite,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, color: cerebroWhite, size: 16),
                    SizedBox(width: 5),
                    Text(
                      'Time:',
                      style: poppinsParagraph.copyWith(
                        color: cerebroWhite,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '7:00 am - 8:00 am',
                      style: poppinsParagraph.copyWith(
                        color: cerebroWhite,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.person, color: cerebroWhite, size: 16),
                    SizedBox(width: 5),
                    Text(
                      'Teacher:',
                      style: poppinsParagraph.copyWith(
                        color: cerebroWhite,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Renato Cruz',
                      style: poppinsParagraph.copyWith(
                        color: cerebroWhite,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.credit_card, color: cerebroWhite, size: 16),
                    SizedBox(width: 5),
                    Text(
                      'Credit:',
                      style: poppinsParagraph.copyWith(
                        color: cerebroWhite,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '3.0',
                      style: poppinsParagraph.copyWith(
                        color: cerebroWhite,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.format_list_numbered,
                        color: cerebroWhite, size: 16),
                    SizedBox(width: 5),
                    Text(
                      'Units:',
                      style: poppinsParagraph.copyWith(
                        color: cerebroWhite,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '3',
                      style: poppinsParagraph.copyWith(
                        color: cerebroWhite,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CerebroIconOnlyButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TeachersClassListPage())); // Navigate to Classlist
                          },
                          iconData: Icons.people),
                      SizedBox(width: 8),
                      CerebroIconOnlyButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TeacherClassAttendance1())); // Navigate to Class Attendance
                          },
                          iconData: Icons.check_box),
                      SizedBox(width: 8),
                      CerebroIconOnlyButton(
                          onPressed: () {
                           Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TeachersGradesEncoding())); // Navigate to Grades Encoding
                          },
                          iconData: Icons.table_chart)
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(bottom: 10, top: 10),
    decoration: BoxDecoration(
      color: cerebroBlue300,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Araling Panlipunan 1',
            style: poppinsParagraph.copyWith(
              fontWeight: FontWeight.w900,
              color: cerebroWhite,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.calendar_today, color: cerebroWhite, size: 16),
              SizedBox(width: 5),
              Text(
                'Date:',
                style: poppinsParagraph.copyWith(
                  color: cerebroWhite,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 5),
              Text(
                'Thursday',
                style: poppinsParagraph.copyWith(
                  color: cerebroWhite,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 20),
              Icon(Icons.access_time, color: cerebroWhite, size: 16),
              SizedBox(width: 5),
              Text(
                'Time:',
                style: poppinsParagraph.copyWith(
                  color: cerebroWhite,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '7:00 am - 8:00 am',
                style: poppinsParagraph.copyWith(
                  color: cerebroWhite,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.person, color: cerebroWhite, size: 16),
              SizedBox(width: 5),
              Text(
                'Teacher:',
                style: poppinsParagraph.copyWith(
                  color: cerebroWhite,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 5),
              Text(
                'Renato Cruz',
                style: poppinsParagraph.copyWith(
                  color: cerebroWhite,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 20),
              Icon(Icons.credit_card, color: cerebroWhite, size: 16),
              SizedBox(width: 5),
              Text(
                'Credit:',
                style: poppinsParagraph.copyWith(
                  color: cerebroWhite,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '3.0',
                style: poppinsParagraph.copyWith(
                  color: cerebroWhite,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.format_list_numbered, color: cerebroWhite, size: 16),
              SizedBox(width: 5),
              Text(
                'Units:',
                style: poppinsParagraph.copyWith(
                  color: cerebroWhite,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '3',
                style: poppinsParagraph.copyWith(
                  color: cerebroWhite,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Your button action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: cerebroWhite,
                side: BorderSide(
                  color: cerebroBlue200,
                ),
                foregroundColor:
                    cerebroBlue100, // Adjust text color for contrast
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.all(6.0),
                minimumSize: Size(50, 30), // Adjust size as needed
              ),
              child: Text(
                'View Attendance',
                style: poppinsParagraph.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
