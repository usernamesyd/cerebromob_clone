import 'package:cerebro_mobile/pages/student/grades/mygrades1.dart';
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
              color: cerebroBlue300,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Table(
              children: [
                TableRow(
                  children: [
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                              color: cerebroBlue200,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                //topRight: Radius.circular(12),
                              ),                               
                            ),
                            padding: EdgeInsets.all(18.0),
                            child: Center(
                              child: Text('Grading Period',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    color: cerebroWhite,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                    ),
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                              color: cerebroBlue200,
                            ),
                            padding: EdgeInsets.all(18.0),
                            child: Center(
                              child: Text('Grades',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    color: cerebroWhite,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                    ),
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                              color: cerebroBlue200,
                              borderRadius: BorderRadius.only(
                                //topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            padding: EdgeInsets.all(18.0),
                            child: Center(
                              child: Text('Remarks',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    color: cerebroWhite,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('Quarter 1',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                color: Colors.black,                                                                 
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      )
                    ),
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,                          
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('84',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      )
                    ),
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('Passed',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      )
                    )
                  ]
                ),
                TableRow(
                  children: [
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('Quarter 2',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      )
                    ),
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('84',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      )
                    ),
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('Passed',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      )
                    )
                  ]
                ),
                TableRow(
                  children: [
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,                      
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('Quarter 3',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      )
                    ),
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,                          
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('84',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      )
                    ),
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('Passed',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      )
                    )
                  ]
                ),
                TableRow(
                  children: [
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('Quarter 4',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      )
                    ),
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('84',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      )
                    ),
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('Passed',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      )
                    )
                  ]
                ),
                TableRow(
                  children: [
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          //bottomRight: Radius.circular(12),
                        ),
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('Final Grade',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      )
                    ),
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                          
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('84',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      )
                    ),
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          //bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('Passed',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      )
                    )
                  ]
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
