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

        child: CerebroLogo(),
      ),
    );
  }
}


class CerebroLogo extends StatefulWidget {
  const CerebroLogo({super.key});

  @override
  State<CerebroLogo> createState() => _CerebroLogoState();
}

class _CerebroLogoState extends State<CerebroLogo> {

  double opacityLevel = 0.0;
  
  void _changeOpacity(){
    setState(() =>  opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }
  
   @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        _changeOpacity();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: AnimatedOpacity(
            opacity: opacityLevel,
            duration: Duration(seconds: 2),
            child: Image(
              image: AssetImage('assets/images/cerebro-splash.png'),
            ),
          ),
        );
  }
}