import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/atoms/cerebro_elevated_btn_outlined.dart';
import 'package:cerebro_mobile/atoms/cerebro_elevated_btn_white.dart';
import 'package:cerebro_mobile/atoms/cerebro_textform_field.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
          SchoolHeaderContainer(),
          LoginContainer(), 
          LoginFooterContainer()
        ],),
      ),

    );
  }
}

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

class SchoolHeaderContainer extends StatelessWidget {
  const SchoolHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/SchoolLogo.png')),
          SizedBox(height: 12),
          Text(
            'Welcome to ABC School of Cavite!',
            style: poppinsH3.copyWith(
              color: cerebroWhite,
            ),
            textAlign: TextAlign.center,
          )
        ],),
    );
  }
}

class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login to CEREBRO®',
            style: poppinsH5.copyWith(
            color: cerebroWhite,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 24), // Margin
          LoginFormField(),
        ],
      )
    );
  }
}

class LoginFormField extends StatelessWidget {
  const LoginFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
              children: [
                CerebroTextFormField(
                  controller: TextEditingController(), 
                  text: 'Email Address',
                  icon: Icons.email,
                ),
                SizedBox(height: 12), // Margin
                CerebroTextFormField(
                  controller: TextEditingController(), 
                  text: 'Password',
                  icon: Icons.lock,
                ),
                SizedBox(height: 32), // Margin
                CerebroElevatedBtn(
                  onPressed: () => {}, 
                  text: 'Login'
                  ),
                  SizedBox(height: 24), // Margin
              ]
            ),
    );
  }
}

class LoginFooterContainer extends StatelessWidget {
  const LoginFooterContainer({super.key});

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