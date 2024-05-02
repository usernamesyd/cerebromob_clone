import 'dart:math';
import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
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
      academicYear: 'ABC School Year 2022-2023',
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
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft, // Align to the left
                  child: Text(
                    'My Classes', // Title added here
                    style: TextStyle(
                      color: Color.fromRGBO(0, 84, 166, 1),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
        gridLineColor: Colors.transparent,
      ),
      child: SfDataGrid(
        source: _classListDataSource,
        frozenColumnsCount: 1,
        columnWidthMode: ColumnWidthMode.fill,
        gridLinesVisibility: GridLinesVisibility.none,
        //gridLinesVisibility: GridLinesVisibility.both,
        //headerGridLinesVisibility: GridLinesVisibility.both,
        columns: [
          GridColumn(
            columnName: 'Academic Period',
            //width: screenWidth * 0.5, // 60% of the screen width
            label: Container(

              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: cerebroWhite), // Add border
                borderRadius: BorderRadius.circular(5.0), // Add rounded corners
                color: cerebroBlue200,
              ),
              child: Text('Academic Period',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
          GridColumn(
            columnName: 'Action',
            label: Container(

              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: cerebroWhite), // Add border
                borderRadius: BorderRadius.circular(5.0), // Add rounded corners
                color: cerebroBlue200,
              ),
              child: Text('Action',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
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
      return Colors.grey[200]!;
    }
    return Color.fromRGBO(204, 232, 251, 100);
  }
  List<Widget> getCellWidgetList(DataGridRow row) {
    var cells = row.getCells();
    return cells.map<Widget>((cell) {
      if (cell.columnName == 'action') {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: cerebroWhite),
            borderRadius: BorderRadius.circular(5.0),
            color: getRowBackgroundColor(),
          ),
          child: Center(
            child: CerebroElevatedBtn(
               onPressed: () {},
              text: 'View',
            ),
          ),
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: cerebroWhite),
            borderRadius: BorderRadius.circular(5.0),
            color: getRowBackgroundColor(),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 0.0),
            child: Text(
              cell.value.toString(),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        );
      }
    }).toList();
  }
  return DataGridRowAdapter(
    color: getRowBackgroundColor(),
    cells: getCellWidgetList(row),
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
