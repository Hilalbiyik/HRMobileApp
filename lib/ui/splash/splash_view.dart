import 'package:flutter/material.dart';
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
      
    });
  }

final sampleLottieUrl = "https://assets6.lottiefiles.com/packages/lf20_8Psf5B.json";
  @override
  Widget build(BuildContext context) {
           
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9), 
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5, 
          height: MediaQuery.of(context).size.width * 0.5, 
          child: Lottie.network(
            sampleLottieUrl, 
            fit: BoxFit.cover, 
          ),
        ),
      ),
    );
  }
}
