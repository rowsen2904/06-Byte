import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_one_v1/constants/colors.dart';
import 'package:new_one_v1/view/widgets/builders/news_builder.dart';
import 'package:new_one_v1/view/widgets/screens_title.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ScreenTitle(title: 'News'),
        FutureBuilder(
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: mainColor,
              ));
            }
            if (snap.hasError) {
              return Center(
                child: Text(
                  'Some thing went wrong',
                  style: GoogleFonts.urbanist(
                    decorationThickness: 2.sp,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              );
            }
            final news = snap.data;
            return NewsBuilder();
          },
        )
      ],
    );
  }
}
