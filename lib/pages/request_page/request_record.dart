import 'dart:math';
import 'package:intl/intl.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class RequestRecord {
  String recordType;
  String requestDescription;
  DateTime submittedDate;
  String status;
  String paymentLink;
  String file;

  RequestRecord({
    required this.recordType,
    required this.requestDescription,
    required this.submittedDate,
    required this.status,
    required this.paymentLink,
    required this.file,
  });
}

class RequestRecordPage extends StatefulWidget {
  @override
  RequestRecordPageState createState() => RequestRecordPageState();
}

class RequestRecordPageState extends State<RequestRecordPage> {
  late DataPagerController _controller;
  int _rowsPerPage = 5; // Default rows per page

  final List<RequestRecord> _data = [
    // First set of records (same records)
    RequestRecord(
      recordType: 'Transcript of Record',
      requestDescription: 'N/A',
      submittedDate: DateTime(2024, 4, 1),
      status: 'Submitted',
      paymentLink: 'Pay Now',
      file: 'Download',
    ),
    RequestRecord(
      recordType: 'Diploma',
      requestDescription: 'N/A',
      submittedDate: DateTime(2024, 4, 2),
      status: 'Submitted',
      paymentLink: 'Pay Now',
      file: 'Download',
    ),
    RequestRecord(
      recordType: 'Transcript of Record',
      requestDescription: 'N/A',
      submittedDate: DateTime(2024, 4, 3),
      status: 'Submitted',
      paymentLink: 'Pay Now',
      file: 'Download',
    ),
    RequestRecord(
      recordType: 'Diploma',
      requestDescription: 'N/A',
      submittedDate: DateTime(2024, 4, 4),
      status: 'Submitted',
      paymentLink: 'Pay Now',
      file: 'Download',
    ),
    RequestRecord(
      recordType: 'Transcript of Record',
      requestDescription: 'N/A',
      submittedDate: DateTime(2024, 4, 5),
      status: 'Submitted',
      paymentLink: 'Pay Now',
      file: 'Download',
    ),
    // Second set of records (different records)
    RequestRecord(
      recordType: 'Diploma',
      requestDescription: 'N/A',
      submittedDate: DateTime(2024, 4, 9),
      status: 'Approved',
      paymentLink: 'Pay Now',
      file: 'Download',
    ),
    RequestRecord(
      recordType: 'Diploma',
      requestDescription: 'N/A',
      submittedDate: DateTime(2024, 4, 10),
      status: 'In Progress',
      paymentLink: 'Pay Now',
      file: 'Download',
    ),
    RequestRecord(
      recordType: 'Transcript of Record',
      requestDescription: 'N/A',
      submittedDate: DateTime(2024, 4, 11),
      status: 'Completed',
      paymentLink: 'Pay Now',
      file: 'Download',
    ),
    RequestRecord(
      recordType: 'Transcript of Record',
      requestDescription: 'N/A',
      submittedDate: DateTime(2024, 4, 12),
      status: 'Cancelled',
      paymentLink: 'Pay Now',
      file: 'Download',
    ),
    RequestRecord(
      recordType: 'Transcript of Record',
      requestDescription: 'N/A',
      submittedDate: DateTime(2024, 4, 13),
      status: 'Submitted',
      paymentLink: 'Pay Now',
      file: 'Download',
    ),
    
  ];
  late var _requestDataSource = _RequestDataSource(data: [], rowsPerPage: 5);

  @override
  void initState() {
    super.initState();
    _controller = DataPagerController();
    _requestDataSource = _RequestDataSource(
        data: _data,
        rowsPerPage:
            _rowsPerPage); // Initialize with initial data and rows per page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Show '),
                    SizedBox(width: 8),
                    DropdownButton<int>(
                      value: _rowsPerPage,
                      onChanged: (value) => setState(() {
                        print("Selected rows per page: $value");
                        _rowsPerPage = value!;
                        _requestDataSource.updateRowsPerPage(
                            value); // Update data source with new rowsPerPage
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
                  ],
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: constraint.maxHeight - 150, // Adjust the height
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
                          itemBorderRadius: BorderRadius.circular(
                              5), // Change unselected item color
                        ),
                      ),
                      child: SfDataPager(
                        visibleItemsCount: 5,
                        delegate: _requestDataSource,
                        controller: _controller,
                        pageCount: double.parse(
                            (_data.length / _rowsPerPage).ceil().toString()),
                        onPageNavigationStart: (int pageIndex) =>
                            _requestDataSource.goToPage(pageIndex),
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
      data: SfDataGridThemeData(headerColor: cerebroBlue200),
      child: SfDataGrid(
        source: _RequestDataSource(
          data: _data,
          rowsPerPage: _rowsPerPage,
        ),
        frozenColumnsCount: 1,
        columnWidthMode: ColumnWidthMode.auto,
        allowPullToRefresh: true,
        columns: [
          GridColumn(
            columnName: 'record-type',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              child: Text('Record Type',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white)),
            ),
          ),
          GridColumn(
            columnName: 'request-description',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text('Request Description',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white)),
            ),
          ),
          GridColumn(
            columnName: 'submitted-date',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text('Submitted Date',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white)),
            ),
            width: 100,
          ),
          GridColumn(
            columnName: 'status',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text('Status',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white)),
            ),
            width: 100,
          ),
          GridColumn(
            columnName: 'payment-link',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text('Payment Link',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white)),
            ),
            width: 100,
          ),
          GridColumn(
            columnName: 'file',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text('File',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white)),
            ),
            width: 100,
          ),
        ],
      ),
    );
  }
}

class _RequestDataSource extends DataGridSource {
  _RequestDataSource({required this.data, required this.rowsPerPage});

  List<RequestRecord> data;
  int rowsPerPage;
  int currentPage = 0; // Track the current page index

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
              columnName: 'record-type',
              value: data[dataIndex].recordType,
            ),
            DataGridCell<String>(
              columnName: 'request-description',
              value: data[dataIndex].requestDescription,
            ),
            DataGridCell<String>(
              columnName: 'submitted-date',
              value: DateFormat('yyyy-MM-dd')
                  .format(data[dataIndex].submittedDate),
            ),
            DataGridCell<String>(
              columnName: 'status',
              value: data[dataIndex].status,
            ),
            DataGridCell<String>(
              columnName: 'payment-link',
              value: data[dataIndex].paymentLink,
            ),
            DataGridCell<String>(
              columnName: 'file',
              value: data[dataIndex].file,
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
        return Colors.grey[100]!;
      }

      return Colors.transparent;
    }

    return DataGridRowAdapter(
      color: getRowBackgroundColor(),
      cells: row.getCells().map<Widget>((e) {
        if (e.columnName == 'payment-link' || e.columnName == 'file') {
          return Center(
            child: TextButton(
              onPressed: () {
                // Handle button press accordingly
                if (e.columnName == 'payment-link') {
                  // Handle payment link button press
                  print('Payment button pressed');
                } else {
                  // Handle file download button press
                  print('Download pressed');
                }
              },
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(cerebroBlue200),
              ),
              child: Text(
                e.value.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } 
        else {
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
