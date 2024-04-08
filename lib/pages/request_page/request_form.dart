import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:flutter/material.dart';

class RequestForm extends StatefulWidget {
  @override
  RequestFormState createState() => RequestFormState();
}

class RequestFormState extends State<RequestForm> {
  String? selectedRequest; // Change the type to nullable String

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text('Choose only one (1) type of request per transaction'),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity, // Take full width of screen
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8), // Add padding
              decoration: BoxDecoration(
                border: Border.all(), // Add border for dropdown field look
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
              child: DropdownButtonHideUnderline(
                // Hide the default underline
                child: DropdownButton<String>(
                  isExpanded: true, // Expand dropdown button to full width
                  value: selectedRequest, // Set to null initially
                  hint: Text('Select'), // Set hint text
                  onChanged: (value) => setState(() => selectedRequest = value),
                  items: ['Transcript of Records', 'Report Card', 'Other']
                      .map((request) => DropdownMenuItem<String>(
                          value: request, child: Text(request)))
                      .toList(),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Center(
              child: CerebroElevatedBtn(
                onPressed: () => print('Request submitted: $selectedRequest'),
                text: ('Submit Request'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
