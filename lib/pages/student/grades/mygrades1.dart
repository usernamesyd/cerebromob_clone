import 'package:cerebro_mobile/atoms/navigation_drawer.dart';
import 'package:cerebro_mobile/pages/student/grades/mygrades2.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
//import 'package:cerebro_mobile/pages/dashboard.dart';

class myGradesPage1 extends StatelessWidget {
  const myGradesPage1({Key? key}); // Fixed super.key to Key? key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CerebroAppBar(title: "Dashboard"),
      drawer: CerebroNavigationDrawer(),
      body: Container(
        color: cerebroWhite,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CoursesPane(),
      ),
    );
  }
}

class CoursesPane extends StatefulWidget {
  const CoursesPane({Key? key}); // Fixed super.key to Key? key

  @override
  State<CoursesPane> createState() => _CoursesPane();
}

class _CoursesPane extends State<CoursesPane> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'My Grades',
            style: poppinsH5.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 18),
          Text(
            'Course Titles',
            style: poppinsParagraph.copyWith(
              color: Colors.black,
              fontSize: 12
            ),
          ),
          SizedBox(height: 28),
          Expanded( 
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                CourseTitleCard(courseTitle: 'English')
              ],
            ),
          ),
        ], 
      ),
    );
  }
}


class CourseTitleCard extends StatefulWidget{
  final String courseTitle;

  CourseTitleCard({
    required this.courseTitle
  });

  @override
  _CourseTitleCardState createState() => _CourseTitleCardState();
}

class _CourseTitleCardState extends State<CourseTitleCard>  {
  @override
  Widget build(BuildContext context) {
     return GestureDetector(
       onTap: () {
         Navigator.pushReplacement(context, 
         MaterialPageRoute(builder: (context) => GradesPage2()));
         },

       child: Card(
        color: cerebroWhite,
        elevation: 1,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 18,  horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.courseTitle,
                      style: poppinsParagraph.copyWith(
                          color: Colors.black,
                          fontSize: 12,),
                    ),
       
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 18,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
           ),
     );
  }

}
