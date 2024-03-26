import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/pages/login/login_page.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';

class ChangeProfile extends StatelessWidget {
  const ChangeProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CerebroAppBar(title: 'ABC School of Cavite'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24), // Adjust bottom padding as needed
                child: Text(
                  'Change Profile Picture',
                  style: poppinsH4.copyWith(color: cerebroBlue200),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0), // Add padding to the bottom
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 100, // Adjust size as needed
                      backgroundImage: AssetImage(
                        'assets/images/profile.png',
                      ),
                    ),
                    SizedBox(height: 20), // Add some space between CircleAvatar and ElevatedButton
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SizedBox(
                  width: 320, // Adjust width as needed
                  child: Container(
                    padding: const EdgeInsets.all(10), // Adjust padding as needed
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: cerebroBlue300, // Outline border color
                        width: 2, // Border width
                      ),
                      borderRadius: BorderRadius.circular(10), // Border radius
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CerebroOutlinedBtn(
                              onPressed: () {
                                // Add functionality for closing here
                              },
                              text: 'Upload Image',
                            ),
                            SizedBox(width: 20), // Add space between texts
                            Text(
                              'No image selected',
                              style: TextStyle(fontSize: 14), // Adjust text font size
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: [
                    CerebroElevatedBtn(
                      onPressed: () => {},
                      text: 'Save Changes',
                    ),
                    ],
                  ),
                ),
                Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: [
                    CerebroOutlinedBtn(
                      onPressed: () => {
                        Navigator.pop(context)
                      },
                      text: 'Close',
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
