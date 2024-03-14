import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';



class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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

        child:Center(
          child: Image(
            image: AssetImage('assets/images/cerebro-splash.png'),
          ),
        ),
      ),
    );
  }
}

