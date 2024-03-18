import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/atoms/cerebro_textform_field.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
            colors: [
              cerebroBlue200, Color.fromRGBO(102, 143, 183, 1)
            ]
          )
        ),
        child: ListView(children: [
          RegisterHeaderContainer(), // You can reuse the SchoolHeaderContainer from the LoginPage
          RegisterContainer(), 
          RegisterFooterContainer()
        ],),
      ),

    );
  }
}

class RegisterHeaderContainer extends StatelessWidget {
  const RegisterHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, 
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8), 
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: cerebroBlue100, 
                ),
              ),
            ),
          ),
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
  const RegisterContainer({super.key});

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
      )
    );
  }
}

class RegisterFormField extends StatelessWidget {
  const RegisterFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CerebroTextFormField(
            controller: TextEditingController(), 
            text: 'Your Email Address',
            icon: Icons.email,
          ),
          SizedBox(height: 12), // Margin
          CerebroTextFormField(
            controller: TextEditingController(), 
            text: 'Your Name',
            icon: Icons.account_box,
          ),
          SizedBox(height: 32), // Margin
          CerebroElevatedBtn(
            onPressed: () => {}, 
            text: 'Sign Up'
          ),
          SizedBox(height: 24), // Margin
        ],
      ),
    );
  }
}

class RegisterFooterContainer extends StatelessWidget {
  const RegisterFooterContainer({super.key});
Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(
                color: cerebroWhite
                ),
              ),
            SizedBox(width: 12),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                },
                child: Text(
                  'Log-in',
                  style: TextStyle(
                    color: cerebroWhite,
                    fontWeight: FontWeight.w700,
                  ),
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
      ]
      ,
    );
  }
}