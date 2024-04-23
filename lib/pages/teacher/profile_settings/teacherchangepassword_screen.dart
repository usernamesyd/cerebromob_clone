import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/atoms/cerebro_passwordform_field.dart';
import 'package:cerebro_mobile/atoms/teacher_navdrawer.dart';
import 'package:cerebro_mobile/organisms/teacher_appbar.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TeacherChangePasswordScreen extends StatelessWidget {
  TeacherChangePasswordScreen({Key? key}) : super(key: key);

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController verifyPasswordController =
      TextEditingController();

  Future<void> changePassword(BuildContext context, String currentPassword,
      String newPassword, String verifyPassword) async {
    if (newPassword != verifyPassword) {
      // Show an error message if the new password and verification do not match
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            alignment: Alignment.center,
            content: Text("Passwords do not match"),
          );
        },
      );
      return;
    }

    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Re-authenticate the user with the current password
        AuthCredential credential = EmailAuthProvider.credential(
            email: user.email!, password: currentPassword);
        await user.reauthenticateWithCredential(credential);

        // Update the password
        await user.updatePassword(newPassword);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password changed successfully"),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ],
            );
          },
        );
        currentPasswordController.clear();
        newPasswordController.clear();
        verifyPasswordController.clear();
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              alignment: Alignment.center,
              content: Text("No user is currently logged in"),
            );
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle errors
      print('Firebase Auth Error Code: ${e.code}');
      String errorMessage;
      if (e.code == 'invalid-credential') {
        errorMessage = 'The current password is incorrect. Please try again.';
      } else if (e.code == 'missing-password') {
        errorMessage = 'Please answer the necessary fields';
      }
      else {
        errorMessage = 'Error changing password: ${e.message}';
      }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            alignment: Alignment.center,
            content: Text(errorMessage),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TeacherNavigationDrawer(),
      appBar: TeacherAppBar(title: 'ABC School of Cavite'),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
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
                  padding: const EdgeInsets.only(bottom: 36),
                  child: Text(
                    'Change Password',
                    style: poppinsH4.copyWith(color: cerebroBlue200),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: cerebroBlue200,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 1.5),
                        ),
                        child: CerebroPasswordFormField(
                          controller: currentPasswordController,
                          hint: 'Current Password',
                          icon: Icons.lock,
                        ),
                      ),
                      SizedBox(height: 24),
                      Container(
                        decoration: BoxDecoration(
                          color: cerebroBlue200,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 1.5),
                        ),
                        child: CerebroPasswordFormField(
                          controller: newPasswordController,
                          hint: 'New Password',
                          icon: Icons.lock,
                        ),
                      ),
                      SizedBox(height: 24),
                      Container(
                        decoration: BoxDecoration(
                          color: cerebroBlue200,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 1.5),
                        ),
                        child: CerebroPasswordFormField(
                          controller: verifyPasswordController,
                          hint: 'Verify Password',
                          icon: Icons.lock,
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CerebroElevatedBtn(
                    onPressed: () {
                      changePassword(
                        context,
                        currentPasswordController.text,
                        newPasswordController.text,
                        verifyPasswordController.text,
                      );
                    },
                    text: 'Save Changes',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CerebroOutlinedBtn(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Close',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
