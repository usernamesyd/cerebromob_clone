import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/atoms/cerebro_textform_field.dart';
import 'package:cerebro_mobile/atoms/cerebro_whiteback_btn.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'forgotpassword2_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
          TopNavigation(),
          SchoolHeaderContainer(),
          ForgotPasswordContainer(), 
          // ForgotPasswordFooterContainer()
        ],),
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
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 40),
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
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image(image: AssetImage('assets/images/SchoolLogo.png')),
          SizedBox(height: 12),
          Text(
            'Email Address Here',
            style: poppinsH2.copyWith(
              color: cerebroWhite,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            'To reset your password kindly enter your email address and an email with the reset link will be sent to you',
          style: poppinsParagraph.copyWith(
            color: cerebroWhite,
          ),
          textAlign: TextAlign.justify,
          ),
          Container(
            margin: EdgeInsets.only(top: 48.0),
            child: Center(
              child: Image(image: AssetImage('assets/images/forgotpassword1.png')),
            ),
          ),
        ],),
    );
  }
}

class ForgotPasswordContainer extends StatelessWidget {
  const ForgotPasswordContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 32),
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
      )
    );
  }
}

class ForgotPasswordField extends StatelessWidget {
  const ForgotPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
              children: [
                CerebroTextFormField(
                  controller: TextEditingController(), 
                  text: 'Email Address',
                  icon: Icons.person,
                ),
                // SizedBox(height: 12), // Margin
                // CerebroTextFormField(
                //   controller: TextEditingController(), 
                //   text: 'Password',
                //   icon: Icons.lock,
                // ),
                SizedBox(height: 32), // Margin
                CerebroElevatedBtn(
                  onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgotPassword2Page()),
                    )
                  }, 
                  text: 'Reset Password'
                  ),
                  SizedBox(height: 24), // Margin

              ]
            ),
    );
  }
}

class ForgotPasswordFooterContainer extends StatelessWidget {
  const ForgotPasswordFooterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
         SizedBox(height: 12),
        Text(
          'Forgot Password?', 
          style: TextStyle(
            color: cerebroWhite
          ),
        ),
         SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: TextStyle(
                color: cerebroWhite
                ),
              ),
            SizedBox(width: 12),
            Text(
              'Create an Account',
              style: TextStyle(
                color: cerebroWhite,
                fontWeight: FontWeight.w700,
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