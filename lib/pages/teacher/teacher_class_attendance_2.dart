import 'package:cerebro_mobile/atoms/cerebro_dropdown_btn.dart';
import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/atoms/cerebro_float_btn.dart';
import 'package:cerebro_mobile/atoms/navigation_drawer.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TeacherClassAttendance2 extends StatelessWidget{
  const TeacherClassAttendance2({Key? key});

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
                  text: "Class Attendance",
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 125.0, 10.0),
                  child: Text(
                    'Rafaela Aquino',
                    style: TextStyle(
                      color: cerebroBlue200,
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                   InkWell(
                    onTap: () {
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        'View More',
                        style: TextStyle(
                          color: cerebroBlue200,
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                  ],
                ),
                SizedBox(height: 20),

                //Implement DataGrid Here-----<>------
                    Container(
                        padding: EdgeInsets.all(20.0),
                        child: SfDataGridTheme(
                          data: SfDataGridThemeData(
                            gridLineColor: Colors.transparent,
                          ),
                          child: SfDataGrid(
                         source: AttachmentDataSource(screenWidth: screenWidth),
                            columnWidthMode: ColumnWidthMode.fill,
                            rowHeight: 55, // Adjust the row height as needed
                            columns: <GridColumn>[
                              GridColumn(
                                columnName: 'Date',
                                 width: screenWidth * 0.4, // 60% of the screen width
                                label: Container(
                                 
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration( 
                                     border: Border.all(color: cerebroWhite), // Add border
                                      borderRadius: BorderRadius.circular(5.0),// Add rounded corners
                                      color: cerebroBlue200,
                                      ),
                                  child: Text('Date', 
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold, 
                                    color: Colors.white)
                                    ),
                                )
                              ),

                              GridColumn(
                                columnName: 'Status',
                                 width: screenWidth * 0.25, // 60% of the screen width
                                label: Container(
                                 
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration( 
                                     border: Border.all(color: cerebroWhite), // Add border
                                      borderRadius: BorderRadius.circular(5.0),// Add rounded corners
                                      color: cerebroBlue200,
                                      ),
                                  child: Text('Status', 
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold, 
                                    color: Colors.white)
                                    ),
                                )
                              ),
                            
                              GridColumn(
                                columnName: 'Action',
                                 width: screenWidth * 0.15, // 15% of the screen width
                                label: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration( 
                                     border: Border.all(color: cerebroWhite), // Add border
                                      borderRadius: BorderRadius.circular(5.0),// Add rounded corners
                                      color: cerebroBlue200,
                                      ),
                                  child: Text('Action', 
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    color: cerebroWhite,
                                    fontWeight: FontWeight.bold,
                                  )),
                                )
                              ),
                            ],
                          ),
                        ),
                      ),

                      Paleattendance(),
                      

                      Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Center(
                      child:CerebroElevatedBtn(
                      onPressed: () {
                      },
                      text: "Save Changes",
                      backgroundColor: cerebroBlue200,
                      textColor: cerebroWhite,
                      ),
                    ),
                   ),

                      SizedBox(height: 20.0),

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
  final VoidCallback status;
  final VoidCallback action; // Changed to VoidCallback

  Attachment({required this.attachment,required this.status, required this.action});
}

class AttachmentDataSource extends DataGridSource {

   final double screenWidth; // Define screenWidth variable

  AttachmentDataSource({required this.screenWidth}); // Constructor to receive screenWidth
  List<Attachment> attachments = [
    Attachment(
        attachment: '03-14-24', status: (){},
        action: () {
          // Define action for Aquino, Rafaela
          // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherClassAttendance2()));
        }),
    Attachment(
        attachment: '03-15-24', status: (){},
        action: () {
          // Define action for Cruzado, Andres
        }),
    Attachment(
        attachment: '03-16-24', status: (){},
        action: () {
          // Define action for Cruzado, Andres
        }),
     Attachment(
        attachment: '03-17-24', status: (){},
        action: () {
          // Define action for Cruzado, Andres
        }),
      
        
  ];

  @override
  List<DataGridRow> get rows => attachments.map(
        (attachment) => DataGridRow(cells: [
          DataGridCell<String>(
              columnName: 'Date', value: attachment.attachment),
          // Placeholder for action column
        ]),
      ).toList();
      

  @override
DataGridRowAdapter buildRow(DataGridRow row) {
  final int rowIndex = effectiveRows.indexOf(row);
  final Color backgroundColor =
      rowIndex % 1 == 0 ? Color.fromRGBO(204, 232, 251, 100) : Colors.grey.shade300;

  List<Widget> getCellWidgetList(DataGridRow row) {
    var cells = row.getCells();
    return [
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border.all(color: cerebroWhite),
          borderRadius: BorderRadius.circular(5.0),
          color: backgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Text(
            cells[0].value.toString(),
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),

      Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: cerebroWhite),
          borderRadius: BorderRadius.circular(5.0),
          color: backgroundColor,
        ),
        child: Center(
          child: SizedBox(
            width: screenWidth * 0.213, // Limit the width of the dropdown
            child: GeneralDropdown(
              items: ['Present', 'Absent', 'Late', 'Excuse'],
              initialValue: 'Present',
              onChanged: (value) {
                print('Selected value: $value');
              },
            ),
          ),
        ),
      ),
      // Action column
      Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: cerebroWhite),
          borderRadius: BorderRadius.circular(5.0),
          color: backgroundColor,
        ),
        child: Center(
          child: IconButton(
            icon: Icon(Icons.delete, color: cerebroBlue200),
            onPressed: () {
              // Action for delete
              print('Delete ${cells[0].value}');
            },
          ),
        ),
      ),
    ];
  }

  return DataGridRowAdapter(cells: getCellWidgetList(row)); // Adjust the height if needed
}
}

// Define a global variable for data source

class Paleattendance extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Obtain the screen width

    return Center(
      child: Container(
        child: SfDataGridTheme(
                          data: SfDataGridThemeData(
                            gridLineColor: Colors.transparent,
                          ),
                          child: SfDataGrid(
                         source: PaleattachmentDataSource(screenWidth: screenWidth),
                            columnWidthMode: ColumnWidthMode.fill,
                        
                            columns: <GridColumn>[
                              GridColumn(
                                columnName: 'Present',
                            
                                label: Container(
                                 
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration( 
                                     border: Border.all(color: cerebroWhite), // Add border
                                      borderRadius: BorderRadius.circular(5.0),// Add rounded corners
                                      color: cerebroBlue200,
                                      ),
                                  child: Text('Present', 
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold, 
                                    color: Colors.white)
                                    ),
                                )
                              ),

                              GridColumn(
                                columnName: 'Absent',
                             
                                label: Container(
                                 
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration( 
                                     border: Border.all(color: cerebroWhite), // Add border
                                      borderRadius: BorderRadius.circular(5.0),// Add rounded corners
                                      color: cerebroBlue200,
                                      ),
                                  child: Text('Absent', 
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold, 
                                    color: Colors.white)
                                    ),
                                )
                              ),
                            
                              GridColumn(
                                columnName: 'Late',
                                label: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration( 
                                     border: Border.all(color: cerebroWhite), // Add border
                                      borderRadius: BorderRadius.circular(5.0),// Add rounded corners
                                      color: cerebroBlue200,
                                      ),
                                  child: Text('Late', 
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    color: cerebroWhite,
                                    fontWeight: FontWeight.bold,
                                  )),
                                )
                              ),

                              GridColumn(
                                columnName: 'Excuse',
                                label: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration( 
                                     border: Border.all(color: cerebroWhite), // Add border
                                      borderRadius: BorderRadius.circular(5.0),// Add rounded corners
                                      color: cerebroBlue200,
                                      ),
                                  child: Text('Excuse', 
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    color: cerebroWhite,
                                    fontWeight: FontWeight.bold,
                                  )),
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
      );
  }

}

class Paleattachment {
  final bool present;
  final bool absent;
  final bool latestud;
  final bool excuse;

  Paleattachment({required this.present, required this.absent,required this.latestud, required this.excuse});
}
class PaleattachmentDataSource extends DataGridSource {
  final double screenWidth;

  PaleattachmentDataSource({required this.screenWidth});

  List<Paleattachment> attachments = [
 
  ];

  @override
  List<DataGridRow> get rows {
    int presentCount = attachments.where((attachment) => attachment.present).length;
    int absentCount = attachments.where((attachment) => attachment.absent).length;
    int lateCount = attachments.where((attachment) => attachment.latestud).length;
    int excuseCount = attachments.where((attachment) => attachment.excuse).length;

    return [
      DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Present', value: presentCount.toString()),
        DataGridCell<String>(columnName: 'Absent', value: absentCount.toString()),
        DataGridCell<String>(columnName: 'Late', value: lateCount.toString()),
        DataGridCell<String>(columnName: 'Excuse', value: excuseCount.toString()),
      ])
    ];
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    List<Widget> getCellWidgetList(DataGridRow row) {
      var cells = row.getCells();
      return [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: cerebroLightGray),
            borderRadius: BorderRadius.circular(5.0),
            color: cerebroWhite,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Text(
              cells[0].value.toString(),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: cerebroLightGray),
            borderRadius: BorderRadius.circular(5.0),
            color: cerebroWhite,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Text(
              cells[1].value.toString(),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: cerebroLightGray),
            borderRadius: BorderRadius.circular(5.0),
            color: cerebroWhite,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Text(
              cells[2].value.toString(),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: cerebroLightGray),
            borderRadius: BorderRadius.circular(5.0),
            color: cerebroWhite,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Text(
              cells[3].value.toString(),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
      ];
    }

    return DataGridRowAdapter(cells: getCellWidgetList(row));
  }
}
