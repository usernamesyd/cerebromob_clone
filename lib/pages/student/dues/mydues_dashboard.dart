import 'dart:math';
import 'package:cerebro_mobile/molecules/searchdues.dart';
import 'package:cerebro_mobile/pages/student/dues/assessment_fees.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class AssessmentTable {
  String assessmentNo;
  DateTime dateIssued;
  DateTime dueDate;
  String amount;
  String status;

  AssessmentTable({
    required this.assessmentNo,
    required this.dateIssued,
    required this.dueDate,
    required this.status,
    required this.amount,
  });
}

class MyDues1 extends StatefulWidget {
  @override
  MyDues1State createState() => MyDues1State();
}

class MyDues1State extends State<MyDues1> {
  late DataPagerController _controller;
  int _rowsPerPage = 5; // Default rows per page

  final List<AssessmentTable> _data = [
    // First set of records (same records)
    AssessmentTable(
      assessmentNo: 'ABC-2024-000009',
      dateIssued: DateTime(2024, 3, 6),
      dueDate: DateTime(2024, 5, 10),
      amount: 'P 100.00',
      status: 'Waiting for Payment',
    ),
    AssessmentTable(
      assessmentNo: 'ABC-2024-000008',
      dateIssued: DateTime(2024, 3, 6),
      dueDate: DateTime(2024, 5, 10),
      amount: 'P 835.00',
      status: 'Partially Paid',
    ),

    AssessmentTable(
      assessmentNo: 'ABC-2024-00007',
      dateIssued: DateTime(2024, 3, 6),
      dueDate: DateTime(2024, 5, 10),
      amount: 'P 1000.00',
      status: 'Fully Paid',
    ),
    AssessmentTable(
      assessmentNo: 'ABC-2024-000006',
      dateIssued: DateTime(2024, 3, 6),
      dueDate: DateTime(2024, 5, 10),
      amount: 'P 835.00',
      status: 'Partially Paid',
    ),
    AssessmentTable(
      assessmentNo: 'ABC-2024-000005',
      dateIssued: DateTime(2024, 3, 6),
      dueDate: DateTime(2024, 5, 10),
      amount: 'P 835.00',
      status: 'Partially Paid',
    ),
    // second set
    AssessmentTable(
      assessmentNo: 'ABC-2024-000004',
      dateIssued: DateTime(2024, 3, 6),
      dueDate: DateTime(2024, 5, 10),
      amount: 'P 835.00',
      status: 'Partially Paid',
    ),
    AssessmentTable(
      assessmentNo: 'ABC-2024-000003',
      dateIssued: DateTime(2024, 3, 6),
      dueDate: DateTime(2024, 5, 10),
      amount: 'P 835.00',
      status: 'Partially Paid',
    ),
  ];

  late var _assessmentDataSource = _AssessmentDataSource(
    data: [],
    context: context,
    rowsPerPage: 5,
  );

  @override
  void initState() {
    super.initState();
    _controller = DataPagerController();
    _assessmentDataSource = _AssessmentDataSource(
      data: _data,
      rowsPerPage: _rowsPerPage,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        'Show ',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 8),
                      DropdownButton<int>(
                        value: _rowsPerPage,
                        onChanged: (value) => setState(() {
                          print("Selected rows per page: $value");
                          _rowsPerPage = value!;
                          _assessmentDataSource.updateRowsPerPage(value);
                        }),
                        items: [5, 10, 20, 30, 50]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'entries',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SearchDues(),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: constraint.maxHeight - 250,
                  width: constraint.maxWidth,
                  child: _buildDataGrid(constraint),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 60,
                  child: Align(
                    alignment: Alignment.center,
                    child: SfTheme(
                      data: SfThemeData(
                        dataPagerThemeData: SfDataPagerThemeData(
                          selectedItemColor: Colors.blue,
                          itemBorderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: SfDataPager(
                        visibleItemsCount: 5,
                        delegate: _assessmentDataSource,
                        controller: _controller,
                        pageCount: (_data.length / _rowsPerPage).ceil().toDouble(),
                        onPageNavigationStart: (int pageIndex) =>
                            _assessmentDataSource.goToPage(pageIndex),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDataGrid(BoxConstraints constraint) {
    return SfDataGridTheme(
      data: SfDataGridThemeData(headerColor: Colors.blue),
      child: SfDataGrid(
        source: _AssessmentDataSource(
          data: _data,
          rowsPerPage: _rowsPerPage,
          context: context,
        ),
        frozenColumnsCount: 1,
        columnWidthMode: ColumnWidthMode.auto,
        allowPullToRefresh: true,
        columns: [
          GridColumn(
            columnName: 'assessment-no',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              child: Text(
                'Assessment Number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            width: 200,
          ),
          GridColumn(
            columnName: 'Date-issued',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text(
                'Date Issued',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          GridColumn(
            columnName: 'due-date',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text(
                'Due Date',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            width: 100,
          ),
          GridColumn(
            columnName: 'amount',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text(
                'Amount',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            width: 100,
          ),
          GridColumn(
            columnName: 'status',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text(
                'Status',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            width: 100,
          ),
        ],
      ),
    );
  }
}

class _AssessmentDataSource extends DataGridSource {
  final BuildContext context;
  _AssessmentDataSource(
      {required this.data, required this.context, required this.rowsPerPage});

  List<AssessmentTable> data;
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
              columnName: 'assessment-no',
              value: data[dataIndex].assessmentNo,
            ),
            DataGridCell<String>(
              columnName: 'Date-issued',
              value: DateFormat('yyyy-MM-dd')
                  .format(data[dataIndex].dateIssued),
            ),
            DataGridCell<String>(
              columnName: 'due-date',
              value:
                  DateFormat('yyyy-MM-dd').format(data[dataIndex].dueDate),
            ),
            DataGridCell<String>(
              columnName: 'amount',
              value: data[dataIndex].amount,
            ),
            DataGridCell<String>(
              columnName: 'status',
              value: data[dataIndex].status,
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
        if (e.columnName == 'assessment-no') {
          return Center(
            child: TextButton(
              onPressed: () {
                if (e.value == 'ABC-2024-000009') {
                  // Navigate to Fees page
                  Navigator.push(
                    context, // Pass the context here
                    MaterialPageRoute(
                      builder: (context) =>
                          Fees(), // Replace with your FeesPage widget
                    ),
                  );
                } else {
                  print('Navigate to payment for ${e.value}');
                }
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.blue), // Assuming cerebroBlue200 is not defined here
              ),
              child: Text(
                e.value.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return Center(
            child: Text(
              e.value.toString(),
              textAlign: TextAlign.center,
            ),
          );
        }
      }).toList(),
    );
  }

  void updateRowsPerPage(int newRowsPerPage) {
    if (rowsPerPage != newRowsPerPage) {
      rowsPerPage = newRowsPerPage;
      currentPage = 0; // Reset currentPage to 0 when rowsPerPage changes
      notifyListeners();
    }
  }

  void goToPage(int pageIndex) {
    print('Navigating to page: $pageIndex');
    currentPage = pageIndex;
    notifyListeners();
  }
}
