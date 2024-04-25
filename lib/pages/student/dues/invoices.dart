import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:cerebro_mobile/molecules/searchdues.dart';


class InvoicesTable {
  String invoiceno;
  String particulars;
  DateTime dateIssued;
  String amount;

  InvoicesTable({
    required this.invoiceno,
    required this.dateIssued,
    required this.particulars,
    required this.amount,
  });
}

class Invoices extends StatefulWidget {
  @override
  InvoicesState createState() => InvoicesState();
}

class InvoicesState extends State<Invoices> {
  late DataPagerController _controller;
  int _rowsPerPage = 5; // Default rows per page

  final List<InvoicesTable> _data = [
    // First set of records (same records)
    InvoicesTable(
      invoiceno: 'ABC-2024-000010',
      particulars: 'Course Description',
      dateIssued: DateTime(2024, 3, 6),
      amount: 'P 62.50',
    ),
    InvoicesTable(
      invoiceno: 'ABC-2024-000009',
      particulars: 'TOR',
      dateIssued: DateTime(2024, 2, 29),
      amount: 'P 100.00',
    ),
     InvoicesTable(
      invoiceno: 'ABC-2024-000008',
      particulars: 'Form 137',
      dateIssued: DateTime(2024, 2, 14),
      amount: 'P 150.00',
    ),
    InvoicesTable(
      invoiceno: 'ABC-2024-000007',
      particulars: 'TOR',
      dateIssued: DateTime(2024, 2, 1),
      amount: 'P 100.00',
    ),
     InvoicesTable(
      invoiceno: 'ABC-2024-000006',
      particulars: 'Course Description',
      dateIssued: DateTime(2024, 1, 25),
      amount: 'P 62.50',
    ),
    InvoicesTable(
      invoiceno: 'ABC-2024-000005',
      particulars: 'TOR',
      dateIssued: DateTime(2024, 1, 10),
      amount: 'P 100.00',
    ),
     InvoicesTable(
      invoiceno: 'ABC-2024-000004',
      particulars: 'Course Description',
      dateIssued: DateTime(2024, 3, 6),
      amount: 'P 62.50',
    ),
    InvoicesTable(
      invoiceno: 'ABC-2024-000003',
      particulars: 'TOR',
      dateIssued: DateTime(2024, 3, 6),
      amount: 'P 100.00',
    ),
     InvoicesTable(
      invoiceno: 'ABC-2024-000002',
      particulars: 'Course Description',
      dateIssued: DateTime(2024, 3, 6),
      amount: 'P 62.50',
    ),
    InvoicesTable(
      invoiceno: 'ABC-2024-000001',
      particulars: 'TOR',
      dateIssued: DateTime(2024, 3, 6),
      amount: 'P 100.00',
    ),
  ];

  late var _assessmentDataSource =
      _AssessmentDataSource(data: [], rowsPerPage: 5);

  @override
  void initState() {
    super.initState();
    _controller = DataPagerController();
    _assessmentDataSource = _AssessmentDataSource(
      data: _data,
      rowsPerPage: _rowsPerPage,
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
                SizedBox(height: 10),
                Text(
                  'My Invoices', // Title updated
                  style: TextStyle(
                    color: Color.fromRGBO(0, 84, 166, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text('Show '),
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
                    Text('entries'),

                    SizedBox(
                        width: 20,
                      ),
                      SearchDues(),
                  ],
                ),
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
                      pageCount:
                          (_data.length / _rowsPerPage).ceil().toDouble(),
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
        ),
        frozenColumnsCount: 1,
        columnWidthMode: ColumnWidthMode.auto,
        allowPullToRefresh: true,
        columns: [
          GridColumn(
            columnName: 'invoiceno',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              child: Text(
                'Invoice Number', // Updated column name
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
              ),
            ),
            width: 200,
          ),
          GridColumn(
            columnName: 'particulars', // Added new column
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text(
                'Particulars', // Updated column name
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
              ),
            ),
          ),
          GridColumn(
            columnName: 'dateIssued',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text(
                'Date Issued',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
              ),
            ),
          ),
          GridColumn(
            columnName: 'amount',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text(
                'Amount',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
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
  _AssessmentDataSource({required this.data, required this.rowsPerPage});

  List<InvoicesTable> data;
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
              columnName: 'invoiceno',
              value: data[dataIndex].invoiceno,
            ),
            DataGridCell<String>(
              columnName: 'particulars',
              value: data[dataIndex].particulars,
            ),
            DataGridCell<String>(
              columnName: 'dateIssued',
              value: DateFormat('yyyy-MM-dd').format(data[dataIndex].dateIssued),
            ),
            DataGridCell<String>(
              columnName: 'amount',
              value: data[dataIndex].amount,
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

  void updateRowsPerPage(int newRowsPerPage) {
    if (rowsPerPage != newRowsPerPage) {
      rowsPerPage = newRowsPerPage;
      currentPage = 0;
      notifyListeners();
    }
  }

  void goToPage(int pageIndex) {
    currentPage = pageIndex;
    notifyListeners();
  }
}
