import 'dart:ui';

import 'package:catch_crack/Screen/On_Off.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFF99C87),
          automaticallyImplyLeading: false
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 24.r,
                    spreadRadius: 16.r,
                    color: Colors.black.withOpacity(0.2),
                  )
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 40.0,
                      sigmaY: 40.0,
                    ),
                    child: Container(
                      height: 300.h,
                      width: 350.h,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16.0.r),
                          border: Border.all(
                            width: 1.5.w,
                            color: Colors.white.withOpacity(0.2),
                          )),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 60.h,
                                  ),
                                  Text(
                                    "તમે અમદાવાદ માં હોય તો જ આનો ઉપયોગ થશે \n બાકી ખોટી ગાંન્ડ મારવી નહી.",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.white.withOpacity(0.6))),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    "App Using Your Risk",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.white.withOpacity(0.6))),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Text(
                                    "ઉપયોગ કરીને જ્યાં હોય ત્યાં પાછું મુકી દેવું સ્કુટી",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            fontSize: 16.sp,
                                            color:
                                            Colors.white.withOpacity(0.6))),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Text(
                                    "આ Catchride કંપની ની crack એપ્લિકેશન બનાવી છે",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            fontSize: 14.sp,
                                            color:
                                            Colors.white.withOpacity(0.6))),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Text(
                                    "મફત માં એક્ટીવા મળે છે અમદાવાદ માં ચાલવા માટે",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            fontSize: 15.sp,
                                            color:
                                            Colors.white.withOpacity(0.6))),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Text(
                                    "Catchride ના પોઇન્ટ પર જઈને\n સ્કુટી ની નંબર પ્લેટ નાખી ને ચાલુ કરો",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            fontSize: 15.sp,
                                            color:
                                            Colors.white.withOpacity(0.6))),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      "Develop By Harsh (બ્બલુ)",
                                      style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50.0.h,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0.r),
                    side: const BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                onPressed: () {
                  print("Next Page");
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OnOffPage()));
                },
                padding: const EdgeInsets.all(10.0),
                color: const Color.fromRGBO(0, 160, 227, 1),
                textColor: Colors.white.withOpacity(0.6),
                child:  Text("Next",
                  style: GoogleFonts.robotoMono(
                      textStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
