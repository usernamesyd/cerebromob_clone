// ignore_for_file: unused_import

import 'package:cerebro_mobile/atoms/pick_and_upload_file.dart';
import 'package:flutter/material.dart';
import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


class Attachment {
  final String attachment;
  final String status;
  final String action;

  Attachment({required this.attachment, required this.status, required this.action});
}

class AttachmentDataSource extends DataGridSource {
  List<Attachment> attachments = [
    Attachment(attachment: 'Document 1', status: 'first', action: 'first 1'),
    Attachment(attachment: 'Document 2', status: 'second', action: 'second 2'),
    Attachment(attachment: 'Document 3', status: 'third', action: 'third 3'),

  ];

  @override
  List<DataGridRow> get rows => attachments.map(
        (attachment) => DataGridRow(cells: [
          DataGridCell<String>(columnName: 'attachment', value: attachment.attachment),
          DataGridCell<String>(columnName: 'status', value: attachment.status),
          DataGridCell<String>(columnName: 'action', value: attachment.action),
        ]),
      ).toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = effectiveRows.indexOf(row);
    final Color backgroundColor = 
    rowIndex % 2 == 0 ? 
    Color.fromRGBO(204, 232, 251, 100) : 
    Colors.white;

    List<Widget> getCellWidgetList(DataGridRow row) {
      var cells = row.getCells();
      return [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          color: backgroundColor,
          child: Text(cells[0].value.toString()),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          color: backgroundColor,
          child: Text(cells[1].value.toString()),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove_red_eye, color: cerebroBlue200),
                onPressed: () {
                  // Action for view
                  print('View ${cells[0].value}');
                },
              ),
              IconButton(
                icon: Icon(Icons.delete, color: cerebroBlue200),
                onPressed: () {
                  // Action for delete
                  print('Delete ${cells[0].value}');
                },
              ),
            ],
          ),
        ),
      ];
    }

    return DataGridRowAdapter(cells: getCellWidgetList(row));
  }
}



// Define a global variable for data source
final AttachmentDataSource dataSource = AttachmentDataSource();

class SchoolRequirementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width; // Obtain the screen width
    double boxWidth = screenWidth * 0.9;
    return Scaffold(
      // Use Scaffold for proper material design structure
      body: SingleChildScrollView(
        // Makes the page scrollable
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.start, // This ensures children align left
            children: [
              SizedBox(height: 12),
              Container(
                width: boxWidth,
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Align column content to the left
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          // Use Expanded to ensure it takes the available space, aligning content to the left
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20.0,
                                color: Colors.black, // Default text color
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Upload Attachments',
                                  style: TextStyle(
                                    color: cerebroBlue300,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0), // Adjust spacing as needed
                      child: Text(
                        'Maximum file upload size: 3MB',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      'Allowed file types; .gif, .jpeg, .jpg',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0), // Adjust spacing as needed
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Title',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: ' *',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20.0,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0), // Space between the title and the dropdown
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(135, 214, 217, 224)),
                          ), // Creates a border around the dropdown
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Please Select...',
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'birth_certificate',
                            child: Text('Birth Certificate'),
                          ),
                        ],
                        onChanged: (String? newValue) {
                          // Handle change
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0), // Adjust spacing as needed
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextField(
                            decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey[400]!, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey[600]!, width: 2.0),
                          ),
                        ))),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0), // Adjust spacing as needed
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Upload a File',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: ' *',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20.0,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0,
                            bottom: 12.0), // Adjust spacing as needed
                        child: GestureDetector(
                          onTap: () {
                            pickAndUploadFile();
                          },
                          child: Image(
                            image: AssetImage("assets/images/uploadPic.png"),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: pickAndUploadFile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cerebroBlue200,
                          side: BorderSide(color: cerebroBlue300),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: Text(
                          'Browse',
                          style: poppinsH6.copyWith(color: cerebroWhite),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 12.0), // Adjust the spacing as needed
                        padding: EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical:
                                4), // Add some padding inside the container
                        decoration: BoxDecoration(
                          color: Color.fromARGB(
                              128, 221, 80, 0), // 50% opacity orange color
                          border: Border.all(
                              color: Color.fromARGB(225, 221, 81, 0)),
                          borderRadius: BorderRadius.circular(
                              4), // Add border around the container
                        ),
                        child: Text(
                          'Each title only requires one attachment. Click conversion tool we provide to merge multiple pages of files',
                          textAlign:
                              TextAlign.center, // Align text in the center
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(
                                255, 0, 0, 0), // Black text color
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0), // Adjust spacing as needed
                      child: Center(
                        child: ElevatedButton(
                          onPressed: pickAndUploadFile,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: cerebroBlue200,
                            side: BorderSide(color: cerebroBlue300),
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Text(
                            'UPLOAD',
                            style: poppinsH5.copyWith(color: cerebroWhite),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ), // Container with tables
              SizedBox(
                height: 12.0,
              ),
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
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                            color: cerebroBlue200,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Attachment Status'),
                          ],
                        ),
                      )
                    ]),
                    SizedBox(height: 8),
                    


                    //Implement DataGrid Here-----<>------
                    Container(
                        width: boxWidth,
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SfDataGridTheme(
                          data: SfDataGridThemeData(
                            headerColor: cerebroBlue200, // Custom header background color
                            //headerHoverColor: Colors.blue.shade300, Optional, for hover effects
                          ),
                          child: SfDataGrid(
                            source: dataSource,
                            columnWidthMode: ColumnWidthMode.fill,
                            columns: <GridColumn>[
                              GridColumn(
                                columnName: 'attachments',
                                label: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  alignment: Alignment.centerLeft,
                                  child: Text('Attachments', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                )
                              ),
                              GridColumn(
                                columnName: 'status',
                                label: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  alignment: Alignment.center,
                                  child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                )
                              ),
                              GridColumn(
                                columnName: 'action',
                                label: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                                  alignment: Alignment.center,
                                  child: Text('Action', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                )
                              ),
                            ],
                          ),
                        ),
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
