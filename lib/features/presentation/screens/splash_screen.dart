import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(bottom: 25.h),
        child: Stack(
          children: [
            Positioned(
              top: -230.h, 
              left: -140.w,
              child: Container(
                height: 410.h,
                width: 446.w,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 122, 245, 0.5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
           
            Positioned(
              top: -300.h, 
              right: -200.w,
              child: Container(
                height: 410.h,
                width: 446.w,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(254, 139, 55, 0.5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
        
            Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(
                  seconds: 3,
                ), 
                builder: (context, opacity, child) {
                  return Opacity(opacity: opacity, child: child);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/translate.png'),
                    SizedBox(height: 25.h),
                    Text(
                      "TRANSLATE ON THE GO",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 90, 151, 0.8),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(146, 200, 253, 0.85),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
   
  }
}