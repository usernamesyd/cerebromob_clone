import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/atoms/teacher_navdrawer.dart';
import 'package:cerebro_mobile/organisms/teacher_appbar.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TeacherChangeProfile extends StatefulWidget {
  const TeacherChangeProfile({Key? key});

  @override
  _TeacherChangeProfileState createState() => _TeacherChangeProfileState();
}

class _TeacherChangeProfileState extends State<TeacherChangeProfile> {
  File? _image;
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TeacherNavigationDrawer(),
      appBar: TeacherAppBar(title: 'ABC School of Cavite'),
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
                padding: const EdgeInsets.only(
                    bottom: 24), // Adjust bottom padding as needed
                child: Text(
                  'Change Profile Picture',
                  style: poppinsH4.copyWith(color: cerebroBlue200),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : AssetImage('assets/images/profile.png')
                              as ImageProvider,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SizedBox(
                  width: 320, // Adjust width as needed
                  child: Container(
                    padding:
                        const EdgeInsets.all(10), // Adjust padding as needed
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
                              onPressed: pickImage,
                              text: 'Upload Image',
                            ),
                            SizedBox(width: 14),
                            Text(
                              _image != null
                                  ? 'Image selected'
                                  : 'No image selected',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        )
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
                      onPressed: () => {Navigator.pop(context)},
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
