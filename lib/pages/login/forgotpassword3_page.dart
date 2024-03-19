import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/atoms/cerebro_textform_field.dart';
import 'package:cerebro_mobile/atoms/cerebro_whiteback_btn.dart';
import 'package:cerebro_mobile/atoms/cerebro_passwordform_field.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'login_page.dart';

class ForgotPassword3Page extends StatelessWidget {
  const ForgotPassword3Page({super.key});

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
                colors: [cerebroBlue200, Color.fromRGBO(102, 143, 183, 1)])),
        child: ListView(
          children: [
            // TopNavigation(),
            SchoolHeaderContainer(),
            ForgotPasswordContainer()
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return const Placeholder();
}

class TopNavigation extends StatelessWidget {
  const TopNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 28),
      child: const WhiteBackButton(),
    );
  }
}

class SchoolHeaderContainer extends StatelessWidget {
  const SchoolHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 72),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image(image: AssetImage('assets/images/SchoolLogo.png')),
          SizedBox(height: 12),
          Text(
            'Password Reset Successfully!',
            style: poppinsH2.copyWith(
              color: cerebroWhite,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            'You have successfully reset your password!',
            style: poppinsParagraph.copyWith(
              color: cerebroWhite,
            ),
            textAlign: TextAlign.justify,
          ),
          Container(
            margin: EdgeInsets.only(top: 48.0),
            child: Center(
              child:
                  Image(image: AssetImage('assets/images/forgotpassword3.png')),
            ),
          ),
        ],
      ),
    );
  }
}

class ForgotPasswordContainer extends StatelessWidget {
  const ForgotPasswordContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Login to CEREBRO®',
            //   style: poppinsH5.copyWith(
            //   color: cerebroWhite,
            //   ),
            //   textAlign: TextAlign.left,
            // ),
            SizedBox(height: 8), // Margin
            ForgotPasswordField(),
          ],
        ));
  }
}

class ForgotPasswordField extends StatelessWidget {
  const ForgotPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        SizedBox(height: 32), // Margin
                Center(
                  child: 
                  CerebroElevatedBtn(
                  onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    )
                  }, 
                  text: 'Go Back'
                  ),
                ),       
        SizedBox(height: 24), // Margin
      ]),
    );
  }
}
