import 'dart:math';
import 'package:cerebro_mobile/atoms/cerebro_floating_btn.dart';
import 'package:cerebro_mobile/organisms/dues_topbar%20.dart';
import 'package:cerebro_mobile/pages/student/dues/mydues_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:cerebro_mobile/atoms/navigation_drawer.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class Fees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CerebroAppBar(
        title: ('ABC School of Cavite'), // Set the title as a Text widget
      ),
      drawer: CerebroNavigationDrawer(), // Adding a drawer
      body: AssessmentFees(),
    );
  }
}

class TuitionFees {
  String Name;
  String Price;

  TuitionFees({
    required this.Name,
    required this.Price,
  });
}

class AssessmentFees extends StatefulWidget {
  @override
  AssessmentFeesState createState() => AssessmentFeesState();
}

class AssessmentFeesState extends State<AssessmentFees> {
// Default rows per page

  final List<TuitionFees> _tuitionData = [
    TuitionFees(Name: 'English 1', Price: 'P 1.00'),
    TuitionFees(Name: 'Math 1', Price: 'P 100.00'),
    TuitionFees(Name: 'Science 1', Price: 'P 500.00'),
    TuitionFees(Name: 'Araling Panlipunan', Price: 'P 32.96'),
    TuitionFees(Name: 'Filipino 1', Price: 'P 250.00'),
  ];

  final List<TuitionFees> _miscellaneousData = [
    TuitionFees(Name: 'Laboratory Fee', Price: 'P 1000.00'),
  ];

  late var _tuitionDataSource =
      _AssessmentDataSource(data: _tuitionData, rowsPerPage: 5);

  late var _miscellaneousDataSource =
      _AssessmentDataSource(data: _miscellaneousData, rowsPerPage: 1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final TextStyle textStyleLabel = TextStyle(
          color: cerebroBlue300, // Change text color
          fontSize: 16, // Change font size
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold, // Change font family
        );
        final TextStyle textStyle = TextStyle(
          color: Colors.black, // Change text color
          fontSize: 18, // Change font size
          fontFamily: 'Poppins', // Change font family
        );
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CerebroFloatingButton(text: "Assessment of Fees"),
                      ],
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              // Assessment Number Row
                              buildRow(
                                  'Assessment Number:', '  ABC-2024-000009'),
                              // Date Created Row
                              buildRow('Date Created:', '  April 10, 2024'),
                              // Tuition Fees Title
                            ],
                          ), // Adding some space between the title and the rows
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Text(
                              'Tuition Fees',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          _buildDataGrid(constraint, _tuitionDataSource),

                          // Miscellaneous Fees Title
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Text(
                              'Miscellaneous Fees',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          _buildDataGrid(constraint, _miscellaneousDataSource),

                          // Divider
                          SizedBox(
                            height: 4,
                          ),
                          Card(
                            color: Colors.grey[100], // Background color
                            elevation: 4, // Shadow elevation
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12.0), // Rounded corners
                            ),
                            margin:
                                EdgeInsets.all(16), // Margin around the card
                            child: Padding(
                              padding:
                                  EdgeInsets.all(16), // Padding inside the card
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.info,
                                                  color: cerebroBlue300),
                                              SizedBox(width: 4),
                                              Text(
                                                'Tuition Fees Total:',
                                                style: textStyleLabel,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'P 883.96',
                                            style: textStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.check_circle,
                                                  color: cerebroBlue300),
                                              SizedBox(width: 4),
                                              Text(
                                                'Miscellaneous Fees Total:',
                                                style: textStyleLabel,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'P 0.00',
                                            style: textStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.check_circle,
                                                  color: cerebroBlue300),
                                              SizedBox(width: 4),
                                              Text(
                                                'Amount to Pay:',
                                                style: textStyleLabel,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'P 883.96',
                                            style: textStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.check_circle,
                                                  color: cerebroBlue300),
                                              SizedBox(width: 4),
                                              Text(
                                                'Remaining Balance:',
                                                style: textStyleLabel,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'P 883.96',
                                            style: textStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.check_circle,
                                                  color: cerebroBlue300),
                                              SizedBox(width: 4),
                                              Text(
                                                'Payment Reference:',
                                                style: textStyleLabel,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            '',
                                            style: textStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      // Handle Payment Link button click
                                    },
                                    icon: Icon(Icons.payment,
                                        size: 24, // Change icon size
                                        color:
                                            Colors.white), // Change icon color
                                    label: Text(
                                      'Pay Online',
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              cerebroBlue300),
                                      foregroundColor:
                                          MaterialStateProperty.all(Colors
                                              .white), // Change button color
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
      },
    );
  }

  Widget _buildDataGrid(
      BoxConstraints constraint, _AssessmentDataSource dataSource) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0), // Adjusted horizontal padding
      child: SizedBox(
        height: dataSource.data.length * 45.0 + 90.0,
        width: constraint.maxWidth,
        child: SingleChildScrollView(
          child: SfDataGridTheme(
            data: SfDataGridThemeData(headerColor: Colors.blue),
            child: SfDataGrid(
              source: dataSource,
              frozenColumnsCount: 1,
              columnWidthMode: ColumnWidthMode.fill,
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.both,
              columns: [
                GridColumn(
                  columnName: 'Name',
                  label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Name',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'Price',
                  label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Price',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable Row widget for Assessment Number and Date Created
  Row buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}

class _AssessmentDataSource extends DataGridSource {
  _AssessmentDataSource({required this.data, required this.rowsPerPage});

  List<TuitionFees> data;
  int rowsPerPage;
  int currentPage = 0;

  @override
  List<DataGridRow> get rows {
    final int startIndex = currentPage * rowsPerPage;
    final int endIndex = min(startIndex + rowsPerPage, data.length);

    if (startIndex >= data.length) {
      return [];
    }

    return List.generate(
      endIndex - startIndex,
      (index) {
        final int dataIndex = startIndex + index;
        return DataGridRow(
          cells: [
            DataGridCell<String>(
              columnName: 'Name',
              value: data[dataIndex].Name,
            ),
            DataGridCell<String>(
              columnName: 'Price',
              value: data[dataIndex].Price,
            ),
          ],
        );
      },
    );
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    Color getRowBackgroundColor() {
      final int index = effectiveRows.indexOf(row);
      if (index % 2 != 0) {
        return Colors.grey[200]!;
      }

      return Colors.transparent;
    }

    return DataGridRowAdapter(
      color: getRowBackgroundColor(),
      cells: row.getCells().map<Widget>((e) {
        return Center(
          child: Text(
            e.value.toString(),
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }
}
