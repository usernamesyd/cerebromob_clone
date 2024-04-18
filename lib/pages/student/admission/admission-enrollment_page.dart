import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';

class AdmissionTable {
  final String period;
  final String status;

  AdmissionTable(
      {required this.period, required this.status});
}

class AttachmentDataSource extends DataGridSource {
  List<AdmissionTable> attachments = [
    AdmissionTable(period: 'AY 22-23 1st Sem', status: 'Admitted'),
    AdmissionTable(period: 'AY 22-23 2nd Sem', status: 'Failed'),
    AdmissionTable(period: 'AY 23-24 1st Sem', status: 'Admitted'),
  ];

  @override
  List<DataGridRow> get rows => attachments
      .map(
        (attachment) => DataGridRow(cells: [
          DataGridCell<String>(
              columnName: 'period', value: attachment.period),
          DataGridCell<String>(columnName: 'status', value: attachment.status),
        ]),
      )
      .toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = effectiveRows.indexOf(row);
    final Color backgroundColor =
        rowIndex % 2 == 0 ? Color.fromRGBO(204, 232, 251, 100) : Colors.white;

    List<Widget> getCellWidgetList(DataGridRow row) {
      var cells = row.getCells();
      return [
        Container(
          alignment: Alignment.center,
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
      ];
    }

    return DataGridRowAdapter(cells: getCellWidgetList(row));
  }
}

// Define a global variable for data source
final AttachmentDataSource dataSource = AttachmentDataSource();

class AdmissionEnrollmentPage extends StatefulWidget {
  @override
  _AdmissionEnrollmentPageState createState() =>
      _AdmissionEnrollmentPageState();
}

class _AdmissionEnrollmentPageState extends State<AdmissionEnrollmentPage> {
  String dropdownValue = 'Please Select...';
  String? _selectedValue;

  void _showSubmissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Submission Successful'),
          content: Text('Your application has been submitted successfully.'),
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

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        color: cerebroBlue200,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Admission Status'),
                      ],
                    ),
                  )
                ]),
                SizedBox(height: 8),
                Center(
                    child: Container(
                  width: boxWidth,
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SfDataGridTheme(
                    data: SfDataGridThemeData(
                      headerColor:
                          cerebroBlue200, // Custom header background color
                      //headerHoverColor: Colors.blue.shade300, Optional, for hover effects
                    ),
                    child: SfDataGrid(
                            source: dataSource,
                            columnWidthMode: ColumnWidthMode.fill,
                            columns: <GridColumn>[
                              GridColumn(
                                columnName: 'period',
                                label: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  alignment: Alignment.center,
                                  child: Text('Admission Period', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                )),
                                GridColumn(
                                columnName: 'status',
                                label: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  alignment: Alignment.center,
                                  child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                )),
                                ]
                  ),
                  ) 
                ))
              ],
            ),
          ),
          // Code for when there are no admission available
          // Container(
          //   width: boxWidth,
          //   padding: EdgeInsets.only(
          //       top: 20.0, bottom: 20.0, left: 15.0, right: 15.0),
          //   decoration: BoxDecoration(
          //     color: Colors.grey.shade300,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          //         RichText(
          //           text: TextSpan(
          //             style: TextStyle(
          //               fontFamily: 'Poppins',
          //               fontSize: 20.0,
          //               color: cerebroBlue200,
          //               fontWeight: FontWeight.bold,
          //               fontStyle: FontStyle.italic,
          //             ),
          //             children: <TextSpan>[
          //               TextSpan(text: 'Admission Status'),
          //             ],
          //           ),
          //         )
          //       ]),
          //       SizedBox(height: 8),
          //       Container(
          //         padding:
          //             EdgeInsets.all(8.0),
          //         decoration: BoxDecoration(
          //           color: Colors.grey.shade500,
          //           borderRadius: BorderRadius.circular(
          //               8.0),
          //         ),
          //         child: Text(
          //           'No Admission Status can be found.',
          //           style: TextStyle(
          //             color: Colors.black,
          //             fontSize: 16.0,
          //             fontWeight: FontWeight.bold
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 16,
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
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Admission Period',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  )
                ]),
                SizedBox(height: 8),
                Container(
                  width: null,
                  height: 40,
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0), // Custom padding
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Please Select...',
                    ),
                    items: [
                      DropdownMenuItem(
                        value: '1_ay23-24',
                        child: Text('1st Sem Academic Year 23-24'),
                      ),
                      DropdownMenuItem(
                        value: '2_ay23-24',
                        child: Text('2nd Sem Academic Year 23-24'),
                      ),
                      DropdownMenuItem(
                        value: '1_ay24-25',
                        child: Text('1st Sem Academic Year 24-25'),
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedValue = newValue;
                      });
                    },
                    value: _selectedValue,
                  ),
                ),
                SizedBox(height: 16),
                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed:
                          _selectedValue == null ? null : _showSubmissionDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            cerebroBlue200, // Ensure this is defined
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                      ),
                      child: Text(
                        'Submit Application',
                        style: poppinsH6.copyWith(
                          // Ensure this is defined
                          color: cerebroWhite, // Ensure this is defined
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
