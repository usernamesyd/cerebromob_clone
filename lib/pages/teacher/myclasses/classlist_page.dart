import 'package:cerebro_mobile/atoms/cerebro_floating_btn.dart';
import 'package:cerebro_mobile/atoms/teacher_navdrawer.dart';
import 'package:cerebro_mobile/organisms/teacher_appbar.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';

class ClassListTable {
  final String name;
  final String gender;

  ClassListTable({required this.name, required this.gender});
}

class AttachmentDataSource extends DataGridSource {
  List<ClassListTable> attachments = [
    ClassListTable(name: 'Aquino, Rafaela', gender: 'F'),
    ClassListTable(name: 'Cruzado, Andres', gender: 'M'),
    ClassListTable(name: 'Dela Rosa, Mateo', gender: 'M'),
    ClassListTable(name: 'Fernandez, Alejandro', gender: 'M'),
  ];

  @override
  List<DataGridRow> get rows => attachments
      .map(
        (attachment) => DataGridRow(cells: [
          DataGridCell<String>(columnName: 'name', value: attachment.name),
          DataGridCell<String>(columnName: 'gender', value: attachment.gender),
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
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            border: Border.all(color: cerebroWhite),
            borderRadius: BorderRadius.circular(5.0), 
            color: backgroundColor,
          ),
          child: Text(
            cells[0].value.toString(),
            style:
                TextStyle(color: cerebroBlue300, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            border: Border.all(color: cerebroWhite),
            borderRadius: BorderRadius.circular(5.0), 
            color: backgroundColor,
          ),
          child: Text(
            cells[1].value.toString(),
            style: TextStyle(color: cerebroBlue100),
          ),
        ),
      ];
    }

    return DataGridRowAdapter(cells: getCellWidgetList(row));
  }
}

// Define a global variable for data source
final AttachmentDataSource dataSource = AttachmentDataSource();

class TeachersClassListPage extends StatefulWidget {
  const TeachersClassListPage({Key? key}) : super(key: key);

  @override
  TeachersClassListPageState createState() => TeachersClassListPageState();
}

class TeachersClassListPageState extends State<TeachersClassListPage> {
  void _showSubmissionDialog() {
    showDialog(
      context: context, // Now context is accessible
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Download Successful'),
          content:
              Text('File has been downloaded to your device successfully.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
              text: 'Class List',
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
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                          child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16.0,
                                            color: cerebroBlue200,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text:
                                                    'abc-Araling Panlipunan 1-349 - Araling Panlipunan 1'),
                                          ],
                                        ),
                                      ))
                                    ]),
                                SizedBox(height: 12),
                                Center(
                                  child: Container(
                                    width: boxWidth,
                                    padding: EdgeInsets.symmetric(vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SfDataGridTheme(
                                      data: SfDataGridThemeData(
                                        // headerColor: cerebroBlue200,
                                        gridLineColor: Colors.transparent,
                                      ),
                                      child: SfDataGrid(
                                          source: dataSource,
                                          columnWidthMode: ColumnWidthMode.fill,
                                          columns: <GridColumn>[
                                            GridColumn(
                                                columnName: 'name',
                                                label: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: cerebroWhite),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0), 
                                                    color: cerebroBlue200,
                                                  ),
                                                  child: Text('Name of Student',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white)),
                                                ),
                                                width: screenWidth * 0.6),
                                            GridColumn(
                                                columnName: 'gender',
                                                label: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: cerebroWhite),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    color: cerebroBlue200,
                                                  ),
                                                  child: Text('Gender',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white)),
                                                ),
                                                width: screenWidth * 0.2),
                                          ]),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      onPressed: _showSubmissionDialog,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: cerebroBlue200,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 16),
                                      ),
                                      child: Text(
                                        'Download Class List',
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
