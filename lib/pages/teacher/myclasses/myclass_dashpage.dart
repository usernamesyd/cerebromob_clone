import 'dart:math';
import 'package:cerebro_mobile/atoms/cerebrosmallbtn.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/atoms/navigation_drawer.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';

class ClassListTable {
  String academicYear;
  String action;

  ClassListTable({
    required this.academicYear,
    required this.action,
  });
}

class ClassAcadPage extends StatefulWidget {
  @override
  ClassAcadPageState createState() => ClassAcadPageState();
}

class ClassAcadPageState extends State<ClassAcadPage> {
  late DataPagerController _controller;
  int _rowsPerPage = 5; // Default rows per page

  final List<ClassListTable> _data = [
    ClassListTable(
      academicYear: 'ABC School Year 2023-2024',
      action: 'View',
    ),
      ClassListTable(
      academicYear: 'ABC School Year 2023-2024',
      action: 'View',
    ),
  ];

  late _ClassListDataSource _classListDataSource;

  @override
  void initState() {
    super.initState();
    _controller = DataPagerController();
    _classListDataSource = _ClassListDataSource(
      data: _data,
      rowsPerPage: _rowsPerPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CerebroAppBar(title: "ABC School of Cavite"),
      drawer: CerebroNavigationDrawer(),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
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
                          itemBorderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: SfDataPager(
                        visibleItemsCount: 5,
                        delegate: _classListDataSource,
                        controller: _controller,
                        pageCount: double.parse(
                            (_data.length / _rowsPerPage).ceil().toString()),
                        onPageNavigationStart: (int pageIndex) =>
                            _classListDataSource.goToPage(pageIndex),
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
      data: SfDataGridThemeData(
        headerColor: cerebroBlue200,
      ),
      child: SfDataGrid(
        source: _classListDataSource,
        frozenColumnsCount: 1,
        columnWidthMode: ColumnWidthMode.fill,
        gridLinesVisibility: GridLinesVisibility.both,
        headerGridLinesVisibility: GridLinesVisibility.both,
        columns: [
          GridColumn(
            columnName: 'academic-year',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              child: Text(
                'Academic Year',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          GridColumn(
            columnName: 'action',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              child: Text(
                'Action',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ],
        selectionMode: SelectionMode.single,
      ),
    );
  }
}

class _ClassListDataSource extends DataGridSource {
  _ClassListDataSource({required this.data, required this.rowsPerPage});

  List<ClassListTable> data;
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
              columnName: 'academic-year',
              value: data[dataIndex].academicYear,
            ),
            DataGridCell<String>(
              columnName: 'action',
              value: data[dataIndex].action,
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
        if (e.columnName == 'action') {
          return Center(
            child: CerebroSmallBtn(onPressed: () {  }, text: 'View',)
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
      currentPage = 0;
      notifyListeners();
    }
  }

  void goToPage(int pageIndex) {
    print('Navigating to page: $pageIndex');
    currentPage = pageIndex;
    notifyListeners();
  }
}
