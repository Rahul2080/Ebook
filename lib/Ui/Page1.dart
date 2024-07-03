import 'package:ebook/Bloc/Ebook/ebook_bloc.dart';
import 'package:ebook/Repository/ModelClass/EbookModel.dart';
import 'package:ebook/Ui/Screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TextEditingController controller = TextEditingController();
  List<String> txt = [
    "All",
    "Business",
    "Comedy",
    "love",
    "Drama",
    "Fun",
    "Thriller",
    "Alone",
  ];
  late List<EbookModel> ebook;

  @override
  void initState() {
    BlocProvider.of<EbookBloc>(context).add(FeatchEbook());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0E29),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: SizedBox(
                height: 40.h,
                child: Row(
                  children: [
                    Container(
                      width: 280.w,
                      height: 50.h,
                      decoration: ShapeDecoration(
                          color: Colors.black54,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: TextField(
                        controller: controller,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Icon(
                      Icons.settings,
                      size: 40,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Color(0xFFF5F5FA),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 190.w,
                  ),
                  Text(
                    'See more',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Color(0xFFBBB1FA),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ListView.separated(
                itemCount: txt.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5, top: 10),
                    child: Container(
                      decoration: ShapeDecoration(
                        color: Color(0xFF2E2E5D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          txt[position],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, position) {
                  return SizedBox(
                    width: 10.w,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 10),
              child: Row(
                children: [
                  Text(
                    'Recommended For You',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Color(0xFFF5F5FA),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                  ),
                  Text(
                    'See more',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Color(0xFFBBB1FA),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300.h,
              child:
                  BlocBuilder<EbookBloc, EbookState>(builder: (context, state) {
                if (state is EbookBlocLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is EbookBlocError) {
                  print("hello");
                  return Center(
                      child: Text(
                    "Errror",
                    style: TextStyle(color: Colors.white),
                  ));
                }
                if (state is EbookBlocLoaded) {
                  ebook = BlocProvider.of<EbookBloc>(context).ebookModel;

                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: ebook.length,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => Screen2(
                                      img: ebook[position].bookImage.toString(),
                                      discription: ebook[position]
                                          .bookDescription
                                          .toString(),
                                      author:
                                          ebook[position].bookAuthor.toString(),book: ebook[position].bookTitle.toString(),
                                    )));
                          },
                          child: Container(
                            width: 200.w,
                            height: 160.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                            child: Image.network(
                              ebook[position].bookImage.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, position) {
                      return SizedBox(
                        width: 10.w,
                      );
                    },
                  );
                } else {
                  return SizedBox();
                }
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, top: 10),
              child: Row(
                children: [
                  Text(
                    'Best Seller',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Color(0xFFF5F5FA),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 190.w,
                  ),
                  Text(
                    'See more',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Color(0xFFBBB1FA),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                separatorBuilder: (context, position) {
                  return SizedBox(
                    width: 10.w,
                  );
                },
                itemBuilder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Screen2(
                                  img: ebook[position].bookImage.toString(),
                                  discription: ebook[position]
                                      .bookDescription
                                      .toString(),
                                  author: ebook[position].bookAuthor.toString(),book: ebook[position].bookTitle.toString(),
                                )));
                      },
                      child: Container(
                        width: 270.w,
                        decoration: ShapeDecoration(
                          color: Color(0xFF2E2E5D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: SizedBox(
                                width: 100.h,
                                height: 100.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Image.asset(
                                    "assets/book1.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 155.w,
                                    child: Text(
                                      'Light Mage',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  SizedBox(
                                    width: 155.w,
                                    child: Text(
                                      'Laurie Forest',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Color(0xFFEBEBF5),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  RatingBar.builder(
                                    initialRating: 3,
                                    itemSize: 20,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
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
                                  SizedBox(height: 5.h),
                                  SizedBox(
                                    width: 155.w,
                                    child: Text(
                                      '1,000+ Listeners',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Color(0xFF6A6A8B),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 6),
              child: Row(
                children: [
                  Text(
                    'Most',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Color(0xFFF5F5FA),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 240.w,
                  ),
                  Text(
                    'See more',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Color(0xFFBBB1FA),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 860.h,
              child: GridView.count(
                crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                childAspectRatio: 300 / 400,
                children: List.generate(
                  6,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 12, right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => Screen2(
                                    img: ebook[index].bookImage.toString(),
                                    discription:
                                        ebook[index].bookDescription.toString(),
                                    author: ebook[index].bookAuthor.toString(),
                                    book: ebook[index].bookTitle.toString(),
                                  )));
                        },
                        child: Container(
                          width: 240.w,
                          decoration: ShapeDecoration(
                            color: Color(0xFF2E2E5D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset("assets/book2.png"),
                              SizedBox(
                                width: 160.w,
                                child: Row(
                                  children: [
                                    Text(
                                      'The Black\n Witch',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Color(0xFFF5F5FA),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 44.w),
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
                              Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: Row(
                                  children: [
                                    Text(
                                      '\$ 99.9',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Color(0xFFF5F5FA),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 80.w),
                                    CircleAvatar(
                                      radius: 17,
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundColor: Color(0xFF2E2E5D),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
