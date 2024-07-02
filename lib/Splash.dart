import 'package:ebook/Page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Page1()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0E29),
      body: Column(
        children: [
          Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 190),
                child: SizedBox(
                    width: 300.w,
                    height: 260.h,
                    child: Image.asset("assets/splash.png"))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 280),
            child: Text(
              "Welcome",
              textAlign: TextAlign.center,
              style:  GoogleFonts.poppins(
                textStyle: TextStyle(
                color: Color(0xFFF5F5FA),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),),
          ),
        ],
      ),
    );
  }
}
