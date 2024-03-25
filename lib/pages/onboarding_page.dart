import 'package:cerebro_mobile/atoms/cerebro_elevated_btn_white.dart';
import 'package:cerebro_mobile/pages/login/login_page.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(_pageListener);
  }

  void _pageListener() {
    setState(() {
      _currentPage = _pageController.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:cerebroBlue200,
      body: Stack(
        children: [
        Container(
          decoration: BoxDecoration(
            gradient:LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              cerebroBlue200, Color.fromRGBO(102, 143, 183, 1)
            ]
          )
          ),
        ),
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              Screen1(),
              Screen2(),
              Screen3(),
            ],
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: _buildProgressBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          _buildDot(
            isCurrentPage: i == _currentPage,
          ),
      ],
    );
  }

  Widget _buildDot({required bool isCurrentPage}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      width: isCurrentPage ? 16.0 : 10.0,
      height: isCurrentPage ? 16.0 : 10.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? cerebroBlue100 : Colors.grey[400],
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/classroom.png'),
          SizedBox(height: 20.0),
          Text(
            'Welcome to CEREBRO®!',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,color:cerebroWhite),
          ),
          SizedBox(height: 10.0),
          Text(
            'Your ultimate e-learning platform for K-12 schools. Unlock DepEd\'s new curriculum with Cerebro\'s comprehensive tools for teaching!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0,color:cerebroWhite),
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/teacher_time.png'),
          SizedBox(height: 20.0),
          Text(
            'Equip Your Teachers With the Right Tools',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,color:cerebroWhite),
          ),
          SizedBox(height: 10.0),
          Text(
            'Help your teachers save up to 400 hours/year! Maximize teaching efficiency with CEREBRO®!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0,color:cerebroWhite),
          ),
        ],
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/collaboration.png'),
          SizedBox(height: 20.0),
          Text(
            'Integrated School Management',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,color:cerebroWhite),
          ),
          SizedBox(height: 10.0),
          Text(
            'Say goodbye to system fragmentation! All in one platform for seamless school operations with Cerebro Plus!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0,color:cerebroWhite),
          ),
            SizedBox(height: 20.0),
          CerebroElevatedBtnWhite(
        onPressed: () {
          Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => LoginPage())
          );
        }, 
        text: 'Get Started'
      ),
        ],
      ),
    );
  }
}