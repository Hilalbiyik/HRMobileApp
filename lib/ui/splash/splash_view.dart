import 'package:flutter/material.dart';
import 'package:hr_mobile_app/constants/constants.dart';
import 'package:hr_mobile_app/ui/onBoarding/onboarding_view.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
       Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
           
    return Scaffold(
      backgroundColor: Colors.white, 
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5, 
          height: MediaQuery.of(context).size.width * 0.5, 
          child: Lottie.network(
            ConstantsAdress.sampleLottieUrl, 
            fit: BoxFit.cover, 
          ),
        ),
      ),
    );
  }
}
