
import 'package:cerebro_mobile/atoms/navigation_drawer.dart';
import 'package:cerebro_mobile/pages/login/mygrades1.dart';
import 'package:cerebro_mobile/pages/login/mygrades2.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/molecules/searchfield.dart';
//import 'package:cerebro_mobile/pages/dashboard.dart';

class ClassList extends StatelessWidget {
  const ClassList({Key? key}); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CerebroAppBar(title: "My Classes"),
      drawer: CerebroNavigationDrawer(),
      body: SingleChildScrollView(
        child: ClassListPane(),
      ),
    );
  }
}

class ClassListPane extends StatefulWidget {
  const ClassListPane({Key? key}); 

  @override
  State<ClassListPane> createState() => _ClassListPane();
}

class _ClassListPane extends State<ClassListPane> {

  String _selectedItem = "ABC School Year 2023-2024";
  List<String> _allItems = [ "ABC School Year 2023-2024", "ABC School Year 2024-2025" /* ... many more items */];
  List<String> _filteredItems = []; // Initialize to an empty list

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems; // Initially show all items
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
         height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DropdownButton<String>(
                  value: _selectedItem,
                   icon: const Icon(Icons.keyboard_arrow_down),
                  items: _filteredItems.map<DropdownMenuItem<String>>((String value) =>
                          DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: poppinsH5.copyWith(
                                fontSize: value == _selectedItem ? 18.0 : 12.0,
                                color: cerebroBlue200,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedItem = value!;
                    });
                  },
                  underline: Container(),
                )
              ],
            ),

                        
            SizedBox(height: 20),

            _selectedItem == "ABC School Year 2023-2024"
            ? Expanded( 
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12)
                ),
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Center(
                     child: Text('GRADE 1',
                     style: poppinsH3.copyWith(
                      color: Colors.black87,
                      fontSize: 30,
                     ),
                     textAlign: TextAlign.center,
                     ),
                   ),
                  
                   Center(
                     child: Text('2023-2024',
                     style: poppinsParagraph.copyWith(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                     ),
                     ),
                   ),
                      
                   SizedBox(height: 15,),
                      
                   CerebroSearchField(),
                      
                   SizedBox(height: 10),
                      
                   Row(
                     children: [
                      Expanded(child: ClassCard()),
                      SizedBox(width: 10),
                      Expanded(child: ClassCard()),
                     ]  
                   ),
                      
                    Row(
                     children: [
                      Expanded(child: ClassCard()),
                      SizedBox(width: 10),
                      Expanded(child: ClassCard()),
                     ]  
                   )     
                  ],
                ),
              ),
            )

            : Expanded(
              child: Container(
                child: Text(
                  'No record yet.'
                ),
              ),
            ),


          ], 
        ),
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cerebroBlue300,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Araling Panlipunan 1',
              style: poppinsParagraph.copyWith(
                fontWeight: FontWeight.bold, 
                color: cerebroWhite,
                fontSize: 10
                ),
                textAlign: TextAlign.center,
            ),
          
            SizedBox(height: 4), 

            Table(
            textDirection: TextDirection.ltr,
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            // border:TableBorder.all(width: 2.0,color: Colors.red),
            children: [
              TableRow(
                children: [
                  Text(
                  'Date:',
                  style: poppinsParagraph.copyWith(
                    color:cerebroWhite,
                    fontSize: 6),
                ),

                Text(
                  'Thursday',
                  style: poppinsParagraph.copyWith(
                    color:cerebroWhite,
                    fontSize: 6 ),
                ),
                ]
              ),
               TableRow(
                children: [
                 Text(
                  'Time:',
                  style: poppinsParagraph.copyWith(
                    color:cerebroWhite,
                    fontSize: 6),
                ),

                Text(
                  '7:00 am - 8:00 am',
                  style: poppinsParagraph.copyWith(
                    color:cerebroWhite,
                    fontSize: 6 ),
                ),
                ]
              ),
              TableRow(
                children: [
                  Text(
                  'Teacher:',
                  style: poppinsParagraph.copyWith(
                    color:cerebroWhite,
                    fontSize: 6),
                ),

                Text(
                  'Renato Cruz',
                  style: poppinsParagraph.copyWith(
                    color:cerebroWhite,
                    fontSize: 6 ),
                ),
                ]
              ),
              TableRow(
                children: [
                  Text(
                  'Credits:',
                  style: poppinsParagraph.copyWith(
                    color:cerebroWhite,
                    fontSize: 6),
                ),

                Text(
                  '3.0',
                  style: poppinsParagraph.copyWith(
                    color:cerebroWhite,
                    fontSize: 6 ),
                ),
                ]
              ),

               TableRow(
                children: [
                  Text(
                  'Units:',
                  style: poppinsParagraph.copyWith(
                    color:cerebroWhite,
                    fontSize: 6),
                ),

                Text(
                  'Thursday',
                  style: poppinsParagraph.copyWith(
                    color:cerebroWhite,
                    fontSize: 6 ),
                ),
                ]
              ),
            ],
        ),

          SizedBox(height: 10),


         Center(
           child: ElevatedButton(
            onPressed: () {
              // Your button action here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: cerebroWhite,
              side: BorderSide(
                color: cerebroBlue200,
              ),
              foregroundColor: cerebroBlue100, // Adjust text color for contrast
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              padding: EdgeInsets.all(6.0),
              minimumSize: Size(50, 30), // Adjust size as needed
            ),
            child: Text('View Attendance',
            style: poppinsParagraph.copyWith(
              fontSize: 8,
              fontWeight: FontWeight.bold
            ),),
                   ),
         )
          ],
        ),
      ),
    );
  }
}

