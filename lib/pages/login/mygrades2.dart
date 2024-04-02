import 'package:cerebro_mobile/pages/login/mygrades1.dart';
import 'package:flutter/material.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/atoms/navigation_drawer.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';

class GradesPage2 extends StatelessWidget {
  const GradesPage2({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CerebroAppBar(title: "ABC School of Cavite"),
      drawer: CerebroNavigationDrawer(),
      body: Container(
        color: cerebroWhite,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: MyGradesContainer(),
      ),
    );
  }
}

class MyGradesContainer extends StatefulWidget {
  const MyGradesContainer({Key? key});

  @override
  State<MyGradesContainer> createState() => _MyGradesContainer();
}

class _MyGradesContainer extends State<MyGradesContainer> {
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
          Row(
            children: [
              
           // Add spacing between icon and first breadcrumb
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => myGradesPage1()),
              );
            },
            child: Text(
              ' Course Titles',
              style: poppinsParagraph.copyWith(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(width: 10),  
          Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey), // Breadcrumb icon
          SizedBox(width: 10),  
          Text(
              'English 1', //whatever subject that was clicked on the page 1 must be displayed in this text display holder
              style: poppinsParagraph.copyWith(
                color: Colors.black,
                fontSize: 12
              ),
            ),     
            ] 
          ),   
          SizedBox(height: 28),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),                  
                    color: cerebroBlue200,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'Final Grade',
                            style: poppinsH6.copyWith(color: cerebroWhite),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '84', // Placeholder text for final grade value
                              style: poppinsH6.copyWith(color: cerebroWhite),
                            ),
                            Text(
                              'Passed',
                              style: TextStyle(
                                color: cerebroWhite,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(                 
                      color: Color.fromRGBO(249, 243, 243, 1),              
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'Quarter 1',
                            style: poppinsH6.copyWith(color: cerebroBlue100),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            '84.00', // Placeholder text for another grade value
                            style: poppinsH6.copyWith(color: cerebroBlue100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(                 
                      color: Color.fromRGBO(249, 243, 243, 1),              
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'Quarter 2',
                            style: poppinsH6.copyWith(color: cerebroBlue100),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            '84.00', // Placeholder text for another grade value
                            style: poppinsH6.copyWith(color: cerebroBlue100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(                 
                      color: Color.fromRGBO(249, 243, 243, 1),              
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'Quarter 3',
                            style: poppinsH6.copyWith(color: cerebroBlue100),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            '84.00', // Placeholder text for another grade value
                            style: poppinsH6.copyWith(color: cerebroBlue100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),                  
                      color: Color.fromRGBO(249, 243, 243, 1),              
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'Quarter 4',
                            style: poppinsH6.copyWith(color: cerebroBlue100),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            '84.00', // Placeholder text for another grade value
                            style: poppinsH6.copyWith(color: cerebroBlue100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
