import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/atoms/cerebro_textform_field.dart';
import 'package:cerebro_mobile/atoms/cerebro_whiteback_btn.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
// import 'registerpassword_page.dart'; // Ensure this page exists in your project
import 'login_page.dart'; // Ensure this page exists in your project
class User {
  String id;
  String email;
  String name;
  User({required this.id, required this.email, required this.name});
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
      };
}
Future<void> registerUser(String email, String name) async {
  final dbRef = FirebaseDatabase.instance.ref();
  final userRef = dbRef.child('users').push(); // Creates a new child with a unique key
  User user = User(id: userRef.key!, email: email, name: name);
  await userRef.set(user.toJson());
}
class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [cerebroBlue200, Color.fromRGBO(102, 143, 183, 1)]),
        ),
        child: ListView(
          children: [
            const RegisterHeaderContainer(),
            RegisterContainer(),
            const RegisterFooterContainer(),
          ],
        ),
      ),
    );
  }
}
class RegisterHeaderContainer extends StatelessWidget {
  const RegisterHeaderContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: Column(
        children: [
          const WhiteBackButton(),
          SizedBox(height: 20),
          Text(
            'Create an Account',
            style: poppinsH2.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Image.asset(
            'assets/images/RegisterPageImage.png',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
class RegisterContainer extends StatelessWidget {
  const RegisterContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24), // Margin
            RegisterFormField(),
          ],
        ));
  }
}
class RegisterFormField extends StatefulWidget {
  const RegisterFormField({Key? key}) : super(key: key);
  @override
  State<RegisterFormField> createState() => _RegisterFormFieldState();
}
class _RegisterFormFieldState extends State<RegisterFormField> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _registerAndSendEmailVerification() async {
  try {
    final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: "yourChosenPassword", // Ensure you handle password input properly.
    );
    // Assuming the user is created successfully, now we save the user's details to Realtime Database
    // Note: It's important to manage what happens next based on your app's flow, especially regarding email verification.
    if (userCredential.user != null) {
      final String userId = userCredential.user!.uid; // Use the UID as the key for the user in the database
      await registerUser(userId, _emailController.text.trim(), _nameController.text.trim());
      // Optionally send verification email
      userCredential.user?.sendEmailVerification();
      // Inform the user to verify their email address (you may want to adjust the flow based on your needs)
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Verify Your Email"),
            content: Text("A verification email has been sent. Please check your email."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss the dialog
                },
              ),
            ],
          );
        },
      );
    }
  } on FirebaseAuthException catch (e) {
    // Handle errors
    String errorMessage = "An error occurred. Please try again.";
    if (e.code == 'weak-password') {
      errorMessage = 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      errorMessage = 'An account already exists for that email.';
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Registration Failed"),
          content: Text(errorMessage),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
// Updated `registerUser` to include the userId parameter
Future<void> registerUser(String userId, String email, String name) async {
  final dbRef = FirebaseDatabase.instance.ref();
  final userRef = dbRef.child('users/$userId'); // Use the userId as the key
  User user = User(id: userId, email: email, name: name);
  await userRef.set(user.toJson());
}
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
           CerebroTextFormField(
            controller: _emailController,
            text: 'Your Email Address',
            icon: Icons.email,
          ),
          SizedBox(height: 12), // Margin
          CerebroTextFormField(
            controller: _nameController,
            text: 'Your Name',
            icon: Icons.account_box,
          ),
          SizedBox(height: 32), // Margin
          CerebroElevatedBtn(
            onPressed: _registerAndSendEmailVerification,
            text: 'Sign Up',
          ),
          SizedBox(height: 24), // Margin
        ],
      ),
    );
  }
  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
class RegisterFooterContainer extends StatelessWidget {
  const RegisterFooterContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(color: cerebroWhite),
            ),
            SizedBox(width: 12),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: Text(
                'Log-in',
                style: TextStyle(color: cerebroWhite, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Powered by:',
              style: TextStyle(color: cerebroWhite, fontSize: 12),
            ),
            SizedBox(
              height: 72,
              child: Image.asset(
                'assets/images/cerebro-splash.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
      ],
    );
  }
}