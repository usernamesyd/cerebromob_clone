import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/atoms/cerebro_floating_btn.dart';
import 'package:cerebro_mobile/atoms/navigation_drawer.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/pages/teacher/myclasses/teacher_class_attendance_2.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TeacherClassAttendance1 extends StatelessWidget {
  const TeacherClassAttendance1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CerebroNavigationDrawer(),
      appBar: CerebroAppBar(title: "ABC School of Cavite"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Positioned(
              child: CerebroFloatingButton(
                text: "Class Attendance",
              ),
            ),
            ClassAttendance(),
          ],
        ),
      ),
    );
  }
}

class ClassAttendance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Obtain the screen width

    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: cerebroLightGray,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 125.0, 10.0),
                  child: Text(
                    'abc-Araling Panlipunan 1-349 - Araling Panlipunan 1',
                    style: TextStyle(
                      color: cerebroBlue200,
                      fontFamily: 'Poppins',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Added some space between the text and the button
                CerebroElevatedBtn(
                  onPressed: () {},
                  text: 'Add Attendance Date',
                  backgroundColor: cerebroBlue200,
                  textColor: cerebroWhite,
                ),
                SizedBox(height: 12),
                // Implement DataGrid Here-----<>------
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: SfDataGridTheme(
                    data: SfDataGridThemeData(
                      gridLineColor: Colors.transparent,
                    ),
                    child: SfDataGrid(
                      source: AttachmentDataSource(context), // Pass context here
                      columnWidthMode: ColumnWidthMode.fill,
                      columns: <GridColumn>[
                        GridColumn(
                          columnName: 'Name of Student',
                          width: screenWidth * 0.5, // 60% of the screen width
                          label: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: cerebroWhite), // Add border
                              borderRadius: BorderRadius.circular(5.0), // Add rounded corners
                              color: cerebroBlue200,
                            ),
                            child: Text('Name of Student',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ),
                        GridColumn(
                          columnName: 'Action',
                          width: screenWidth * 0.3, // 20% of the screen width
                          label: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: cerebroWhite), // Add border
                              borderRadius: BorderRadius.circular(5.0), // Add rounded corners
                              color: cerebroBlue200,
                            ),
                            child: Text('Action',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  color: cerebroWhite,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Center(
                    child: CerebroElevatedBtn(
                      onPressed: () {},
                      text: 'DOWNLOAD CLASS ATTENDANCE',
                      backgroundColor: cerebroBlue200,
                      textColor: cerebroWhite,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Attachment {
  final String attachment;
  final VoidCallback action;

  Attachment({required this.attachment, required this.action});
}

class AttachmentDataSource extends DataGridSource {
  List<Attachment> attachments;

  AttachmentDataSource(BuildContext context)
      : attachments = [
          Attachment(
            attachment: 'Aquino, Rafaela',
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherClassAttendance2()),
              );
            },
          ),
          Attachment(
            attachment: 'Cruzado, Andres',
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherClassAttendance2()),
              );
            },
          ),
          Attachment(
            attachment: 'Dela Rosa, Mateo',
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherClassAttendance2()),
              );
            },
          ),
          Attachment(
            attachment: 'Fernandez, Alejandro',
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherClassAttendance2()),
              );
            },
          ),
        ];

  @override
  List<DataGridRow> get rows => attachments
      .map(
        (attachment) => DataGridRow(cells: [
          DataGridCell<String>(
              columnName: 'Name of Student', value: attachment.attachment),
        ]),
      )
      .toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = effectiveRows.indexOf(row);
    final Color backgroundColor = rowIndex % 2 == 0
        ? Color.fromRGBO(204, 232, 251, 100)
        : Colors.grey.shade300;

    List<Widget> getCellWidgetList(DataGridRow row) {
      var cells = row.getCells();
      return [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: cerebroWhite), // Add border
            borderRadius: BorderRadius.circular(5.0),
            color: backgroundColor,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 0.0),
            child: Text(
              cells[0].value.toString(),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
        // Action column
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: cerebroWhite), // Add border
            borderRadius: BorderRadius.circular(5.0), // Add rounded corners
            color: backgroundColor,
          ),
          child: Center(
            child: ElevatedButton(
              onPressed: attachments[rowIndex].action, // Bind action callback
              style: ElevatedButton.styleFrom(
                minimumSize: Size(20, 20),
                backgroundColor: cerebroBlue200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Set button corners to square
                ),
              ),
              child: Text(
                'View',
                style: poppinsH6.copyWith(color: cerebroWhite),
              ),
            ),
          ),
        ),
      ];
    }

    return DataGridRowAdapter(cells: getCellWidgetList(row));
  }
}

// Define a valid TextStyle for poppinsH6
final TextStyle poppinsH6 = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: Colors.white, // Default color
);
