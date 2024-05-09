import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/atoms/cerebro_floating_btn.dart';
import 'package:cerebro_mobile/atoms/navigation_drawer.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StudentAttendance extends StatelessWidget{
  const StudentAttendance({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CerebroNavigationDrawer(),
      appBar: CerebroAppBar(title: "ABC School of Cavite"),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Positioned(
              child: CerebroFloatingButton(
                  text: "Araling Panlipunan 1",
                  )
                ),

          ClassAttendance(),
        ]
        ),


      )
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
                Container(  
                  padding: EdgeInsets.all(20.0),
                  child: SfDataGridTheme(
                    data: SfDataGridThemeData(
                      gridLineColor: Colors.transparent,
                    ),
                    child: SfDataGrid(
                      source: dataSource,
                      columnWidthMode: ColumnWidthMode.fill,
                      columns: <GridColumn>[
                        GridColumn(
                          columnName: 'Attendance Date',
                            width: screenWidth * 0.5, // 60% of the screen width
                          label: Container(

                            alignment: Alignment.center,
                            decoration: BoxDecoration( 
                                border: Border.all(color: cerebroWhite), // Add border
                                borderRadius: BorderRadius.circular(5.0),// Add rounded corners
                                color: cerebroBlue200,
                                ),
                            child: Text('Attendance Date', 
                            style: poppinsH5.copyWith(
                                  color: cerebroWhite,
                                  fontWeight: FontWeight.bold)
                            ),
                          )
                        ),

                        GridColumn(
                          columnName: 'Remarks',
                            width: screenWidth * 0.3, // 20% of the screen width
                          label: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration( 
                                border: Border.all(color: cerebroWhite), // Add border
                                borderRadius: BorderRadius.circular(5.0),// Add rounded corners
                                color: cerebroBlue200,
                                ),
                            child: Text('Remarks', 
                             style: poppinsH5.copyWith(
                                  color: cerebroWhite,
                                  fontWeight: FontWeight.bold)
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Center(
                child:CerebroElevatedBtn(
                onPressed: () {
                },
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
  final VoidCallback action; // Changed to VoidCallback

  Attachment({required this.attachment, required this.action});
}

class AttachmentDataSource extends DataGridSource {
  List<Attachment> attachments = [
    Attachment(
        attachment: 'April 17,2024 - Wednesday',

        action: () {

        }),
    Attachment(
        attachment: 'March 15,2024 - Friday',
        action: () {
        }),     
      ];

  @override
  List<DataGridRow> get rows => attachments.map(
        (attachment) => DataGridRow(cells: [
          DataGridCell<String>(
              columnName: 'Attendance Date', value: attachment.attachment),
          // Placeholder for action column
        ]),
      ).toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = effectiveRows.indexOf(row);
    final Color backgroundColor =
        rowIndex % 2 == 0 ? Color.fromRGBO(204, 232, 251, 100) : Colors.grey.shade300;

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
          borderRadius: BorderRadius.circular(5.0),// Add rounded corners
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
                'Present',
                style: poppinsH6.copyWith(color: Colors.black),
              ),
        ),
      ),
      ];
    }

    return DataGridRowAdapter(cells: getCellWidgetList(row));
  }
}


// Define a global variable for data source
final AttachmentDataSource dataSource = AttachmentDataSource();