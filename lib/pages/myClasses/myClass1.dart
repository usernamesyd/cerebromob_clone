import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/atoms/navigation_drawer.dart';
import 'package:cerebro_mobile/pages/login/mygrades1.dart';
import 'package:cerebro_mobile/pages/myClasses/class_list.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';

class MyClassPage extends StatelessWidget {
  const MyClassPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CerebroAppBar(title: "ABC School of Cavite"),
      drawer: CerebroNavigationDrawer(),
      body: Container(
        color: cerebroWhite,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: MyClassPane(),
      )
    );
  }
}

class MyClassPane extends StatefulWidget {
  const MyClassPane({Key? key});

  @override
  State<MyClassPane> createState() => _MyClassPane();
}

class _MyClassPane extends State<MyClassPane> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'My Classes',
            style: poppinsH5.copyWith(
              color: cerebroBlue300,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 18),
          Center(
            child: Table(
              children: [
                TableRow(
                  children: [
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                              color: cerebroBlue200,
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border(
                                top:
                                    BorderSide(width: 1.0, color: cerebroWhite),
                                bottom:
                                    BorderSide(width: 1.0, color: cerebroWhite),
                                left:
                                    BorderSide(width: 2.0, color: cerebroWhite),
                                right:
                                    BorderSide(width: 1.0, color: cerebroWhite),
                              ),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text('Academic Period',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12.0,
                                    color: cerebroWhite,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                    ),
                    TableCell(child: Container(
                      decoration: BoxDecoration(
                              color: cerebroBlue200,
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border(
                                top:
                                    BorderSide(width: 1.0, color: cerebroWhite),
                                bottom:
                                    BorderSide(width: 1.0, color: cerebroWhite),
                                left:
                                    BorderSide(width: 2.0, color: cerebroWhite),
                                right:
                                    BorderSide(width: 1.0, color: cerebroWhite),
                              ),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text('Action',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12.0,
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
                    TableCell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border(
                            top: BorderSide(
                                width: 1.0, color: cerebroWhite),
                            bottom: BorderSide(
                                width: 1.0, color: cerebroWhite),
                            left: BorderSide(
                                width: 2.0, color: cerebroWhite),
                            right: BorderSide(
                                width: 1.0, color: cerebroWhite),
                          ),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('ABC School Year 2023-2024',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border(
                            top: BorderSide(
                                width: 1.0, color: cerebroWhite),
                            bottom: BorderSide(
                                width: 1.0, color: cerebroWhite),
                            left: BorderSide(
                                width: 2.0, color: cerebroWhite),
                            right: BorderSide(
                                width: 1.0, color: cerebroWhite),
                          ),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ClassList()));
                            }, 
                            style: ElevatedButton.styleFrom(
                            //padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16), // Adjust padding
                            minimumSize: Size(100, 42), // Adjust minimum size
                            backgroundColor: cerebroBlue200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text('View',
                              style: poppinsH6.copyWith(
                              color: cerebroWhite,
                            ),
                            
                          )
                        ),
                        ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border(
                            top: BorderSide(
                                width: 1.0, color: cerebroWhite),
                            bottom: BorderSide(
                                width: 1.0, color: cerebroWhite),
                            left: BorderSide(
                                width: 2.0, color: cerebroWhite),
                            right: BorderSide(
                                width: 1.0, color: cerebroWhite),
                          ),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('ABC School Year 2024-2025  ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border(
                            top: BorderSide(
                                width: 1.0, color: cerebroWhite),
                            bottom: BorderSide(
                                width: 1.0, color: cerebroWhite),
                            left: BorderSide(
                                width: 2.0, color: cerebroWhite),
                            right: BorderSide(
                                width: 1.0, color: cerebroWhite),
                          ),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => myGradesPage1()));
                            }, 
                            style: ElevatedButton.styleFrom(
                            //padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16), // Adjust padding
                            minimumSize: Size(100, 42), // Adjust minimum size
                            backgroundColor: cerebroBlue200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text('View',
                              style: poppinsH6.copyWith(
                              color: cerebroWhite,
                            ),
                          )
                        ),
                        ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
