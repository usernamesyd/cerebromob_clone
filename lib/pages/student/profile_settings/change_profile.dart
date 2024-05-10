import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/atoms/navigation_drawer.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/pages/student/profile_settings/profile_screen.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'dart:io';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({Key? key}) : super(key: key);

  @override
  _ChangeProfileState createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //final databaseReference = FirebaseDatabase.instance.reference().child('users');
  File? _image;
  String? _imageUrl;
  final picker = ImagePicker();

  /*@override
  void initState() {
    super.initState();
    fetchProfilePictureUrl();
  }*/


   /*Future<String> uploadImage(File imageFile) async {
    try {
      final filename = '${DateTime.now().millisecondsSinceEpoch}.${imageFile.path.split('.').last}';
      final storageRef = FirebaseStorage.instance.ref().child('profile_images/$filename');
      final uploadTask = storageRef.putFile(imageFile);
      await uploadTask;
      final imageUrl = await storageRef.getDownloadURL();
      return imageUrl;
    } catch (error) {
      print('Error uploading image: $error');
      rethrow;
    }
  }*/
  //function saving selected image
  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  String? get currentUserId => auth.currentUser?.uid;

  /*Future<void> saveProfile() async {
    if (_image == null) return;

    try {
      final imageUrl = await uploadImage(_image!);
      final userUpdates = <String, String>{
        'profile_picture': imageUrl,
      };

      if (auth.currentUser?.uid != null) {
        await databaseReference.child(auth.currentUser!.uid).update(userUpdates);

        // Set the newly uploaded image URL as the profile picture URL
        setState(() {
          _imageUrl = imageUrl;
        });

        // Show success dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Success!'),
            content: Text('Your profile picture has been uploaded successfully.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        print('User not logged in. Cannot update profile picture.');
      }
    } catch (error) {
      print('Error saving image URL to database: $error');
      // Show error dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred while saving profile picture details. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }*/

  /*Future<void> fetchProfilePictureUrl() async {
  try {
    // Using `onValue` instead of `once` to listen for changes continuously
    databaseReference.child(currentUserId!).onValue.listen((event) {
      Map<dynamic, dynamic>? values = (event.snapshot.value as Map<dynamic, dynamic>?);
      if (values != null) {
        setState(() {
          _imageUrl = values['profile_picture'];
        });
      }
    });
  } catch (error) {
    print('Error fetching profile picture URL: $error');
  }
}*/

  //start of structure styling
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CerebroNavigationDrawer(),
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
                padding: const EdgeInsets.only(bottom: 24),
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
                          : (_imageUrl != null
                              ? NetworkImage(_imageUrl!) 
                              : AssetImage('assets/images/profile.png') as ImageProvider),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SizedBox(
                  width: 320,
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
                              onPressed: pickImage,
                              text: 'Upload Image',
                            ),
                            SizedBox(width: 14),
                            Text(
                              _image != null ? 'Image selected' : 'No image selected',
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
                      onPressed: () => {},//saveProfile, //btn to save the changed profile
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
                      onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ProfileScreen()));
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
