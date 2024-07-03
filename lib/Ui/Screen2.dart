import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen2 extends StatefulWidget {
  final String img;
  final String discription;
  final String author;
  final String book;


  const Screen2(
      {super.key,
      required this.img,
      required this.discription,
      required this.author, required this.book});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E2E5D),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 390.h,
                  width: double.infinity,
                  color: Color(0xFF0E0E29),
                  child: Opacity(
                    opacity: 0.25,
                    child: Image.network(
                      widget.img,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40,top: 30),
                  child: Container(
                    height: 120.h,
                    width: 300.w,
                                child: Column(
                                  children: [
                                    Text(
                                      widget.author,textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          //Color(0xFFF5F5FA),
                                          fontSize: 26.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.book,textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color:Colors.red,
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ) ,
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 90, top: 160),
                  child: SizedBox(
                    width: 200.w,
                    height: 200.h,
                    child: Image.network(
                      widget.img,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 86, top: 398),
                  child: Container(
                    width: 230.w,
                    height: 52.h,
                    decoration: ShapeDecoration(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Row(
                        children: [
                          Container(
                            width: 50.w,
                            height: 30.h,
                            decoration: ShapeDecoration(
                              color: Color(0xFF2E2E5D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: 1,
                                  itemSize: 20,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 1,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                Text(
                                  '4.0',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFFF5F5FA),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Container(
                            width: 75.w,
                            height: 30.h,
                            decoration: ShapeDecoration(
                              color: Color(0xFF2E2E5D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                'Fantasy',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Color(0xFFF5F5FA),
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            width: 78.w,
                            height: 30.h,
                            decoration: ShapeDecoration(
                              color: Color(0xFF2E2E5D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                '430 Pages',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Color(0xFFF5F5FA),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Text(
                'Synopsis',
                style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(
                    color: Color(0xFFF5F5FA),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7, top: 20),
              child: SizedBox(
                width: 420,
                child: Text(
                  widget.discription,
                  style: GoogleFonts.playfairDisplay(
                    textStyle: TextStyle(
                      color: Color(0xFFD5D5E3),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 31,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Color(0xFF0E0E29),
                        child: Icon(
                          Icons.bookmark_outline_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.w),
                  Container(
                    width: 210.w,
                    height: 60.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Container(
                        width: 200.w,
                        height: 55.h,
                        decoration: ShapeDecoration(
                          color: Color(0xFF0E0E29),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Buy",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xFFF5F5FA),
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
