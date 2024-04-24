import 'package:cerebro_mobile/atoms/cerebro_floating_btn.dart';
import 'package:cerebro_mobile/atoms/teacher_navdrawer.dart';
import 'package:cerebro_mobile/organisms/teacher_appbar.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';

class GradesTable {
  final String name;
  final String grades;
  GradesTable({required this.name, required this.grades});
}

class AttachmentDataSource extends DataGridSource {
  List<GradesTable> attachments = [
    GradesTable(name: 'Aquino, Rafaela', grades: '90.00'),
    GradesTable(name: 'Cruzado, Andres', grades: '88.00'),
    GradesTable(name: 'Dela Rosa, Mateo', grades: '95.00'),
    GradesTable(name: 'Fernandez, Alejandro', grades: '87.00'),
    GradesTable(name: 'Gonzales, Bianca', grades: '90.00'),
    GradesTable(name: 'Evangelista, Jose Manuel', grades: '80.00'),
    GradesTable(name: 'Castro, Mariana', grades: '82.00'),
  ];
  @override
  List<DataGridRow> get rows => attachments
      .map(
        (attachment) => DataGridRow(cells: [
          DataGridCell<String>(columnName: 'name', value: attachment.name),
          DataGridCell<String>(columnName: 'grades', value: attachment.grades),
        ]),
      )
      .toList();
  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = effectiveRows.indexOf(row);
    final Color backgroundColor =
        rowIndex % 2 == 0 ? Colors.white : Colors.grey.shade100;
    List<Widget> getCellWidgetList(DataGridRow row) {
      var cells = row.getCells();
      return [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          color: backgroundColor,
          child: Text(
            cells[0].value.toString(),
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          color: backgroundColor,
          child: Text(
            cells[1].value.toString(),
            style: TextStyle(color: Colors.black),
          ),
        ),
      ];
    }

    return DataGridRowAdapter(cells: getCellWidgetList(row));
  }
}

// Define a global variable for data source
final AttachmentDataSource dataSource = AttachmentDataSource();

class TeachersGradesEncoding extends StatelessWidget {
  const TeachersGradesEncoding({Key? key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boxWidth = screenWidth * 0.9;
    return Scaffold(
        appBar: TeacherAppBar(title: "ABC School of Cavite"),
        drawer: TeacherNavigationDrawer(),
        body: Column(
          children: [
            CerebroFloatingButton(
              text: 'Encoding of Grades',
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Container(
                          width: boxWidth,
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 15.0, right: 15.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 10.0, 125.0, 20.0),
                                  child: Text(
                                    'abc-Araling Panlipunan 1-349 - Araling Panlipunan 1',
                                    style: TextStyle(
                                        color: cerebroBlue200,
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                SizedBox(height: 12),

                                //DataGrid Table v
                                Center(
                                  child: Container(
                                    width: boxWidth,
                                    margin: EdgeInsets.only(
                                        top: 0,
                                        left: 8,
                                        bottom: 20), // Added bottom padding
                                     // More rounded corners
                                      
                                    child: SfDataGridTheme(
                                      data: SfDataGridThemeData(
                                        headerColor: cerebroBlue200,
                                        gridLineColor: Colors.white,
                                      ),
                                      child: SfDataGrid(
                                          source: dataSource,
                                          columnWidthMode: ColumnWidthMode.fill,
                                          columns: <GridColumn>[
                                            GridColumn(
                                                columnName: 'name',
                                                width: screenWidth * 0.6,
                                                label: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                                  alignment: Alignment.center,
                                                  child: Text('Name of Student',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white)),
                                                )),
                                            GridColumn(
                                                columnName: 'grades',
                                                width: screenWidth * 0.2,
                                                label: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                                  alignment: Alignment.center,
                                                  child: Text('Quarter 1',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white)),
                                                )),
                                          ]),
                                    ),
                                  ),
                                ),

                                //DataGrid Table ^

                                SizedBox(
                                  height: 4,
                                ),
                                Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: cerebroBlue200,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 16),
                                      ),
                                      child: Text(
                                        'Download Gradesheet',
                                        style: poppinsH6.copyWith(
                                          color: cerebroWhite,
                                        ),
                                      ),
                                    ))
                              ])),
                    ]))
          ],
        ));
  }
}
