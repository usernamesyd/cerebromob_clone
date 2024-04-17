// ignore_for_file: unused_import

import 'package:cerebro_mobile/atoms/pick_and_upload_file.dart';
import 'package:flutter/material.dart';
import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';

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
                    Center(
                      child: Table(
                        // border: TableBorder.all(),
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                  child: Container(
                                decoration: BoxDecoration(
                                  color: cerebroBlue200,
                                  borderRadius: BorderRadius.circular(4.0),
                                  border: Border(
                                    top: BorderSide(
                                        width: 1.0, color: cerebroWhite),
                                    bottom: BorderSide(
                                        width: 1.0, color: cerebroWhite),
                                    left: BorderSide(
                                        width: 1.0, color: cerebroWhite),
                                    right: BorderSide(
                                        width: 2.0, color: cerebroWhite),
                                  ),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text('Attachment',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12.0,
                                        color: cerebroWhite,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              )),
                              TableCell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: cerebroBlue200,
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border(
                                      top: BorderSide(
                                          width: 1.0, color: cerebroWhite),
                                      bottom: BorderSide(
                                          width: 1.0, color: cerebroWhite),
                                      left: BorderSide(
                                          width: 2.0, color: cerebroWhite),
                                      right: BorderSide(
                                          width: 1.0, color: cerebroWhite),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text('Status',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12.0,
                                          color: cerebroWhite,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: cerebroBlue200,
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border(
                                      top: BorderSide(
                                          width: 1.0, color: cerebroWhite),
                                      bottom: BorderSide(
                                          width: 1.0, color: cerebroWhite),
                                      left: BorderSide(
                                          width: 2.0, color: cerebroWhite),
                                      right: BorderSide(
                                          width: 1.0, color: cerebroWhite),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text('Action',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12.0,
                                          color: cerebroWhite,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border(
                                top: BorderSide(
                                    width: 0.5,
                                    color: cerebroWhite),
                                bottom: BorderSide(
                                    width: 1.0,
                                    color: cerebroWhite),
                                left: BorderSide(
                                    width: 1.0,
                                    color: cerebroWhite),
                                right: BorderSide(
                                    width: 2.0,
                                    color: cerebroWhite),
                              ),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('Sample',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12.0,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border(
                                top: BorderSide(
                                    width: 0.5,
                                    color: cerebroWhite),
                                bottom: BorderSide(
                                    width: 1.0,
                                    color: cerebroWhite),
                                left: BorderSide(
                                    width: 2.0,
                                    color: cerebroWhite),
                                right: BorderSide(
                                    width: 1.0,
                                    color: cerebroWhite),
                              ),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('Sample',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12.0,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border(
                                top: BorderSide(
                                    width: 0.5,
                                    color: cerebroWhite),
                                bottom: BorderSide(
                                    width: 1.0,
                                    color: cerebroWhite),
                                left: BorderSide(
                                    width: 2.0,
                                    color: cerebroWhite),
                                right: BorderSide(
                                    width: 1.0,
                                    color: cerebroWhite),
                              ),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('Sample',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12.0,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                        ],
                      ),
                    ),
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
