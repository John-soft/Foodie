import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/background_container.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/constants/uidata.dart';
import 'package:foodie/views/categories/widget/category_tile.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: const ReusableText(
            text: 'Categories',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: kGray),
      ),
      body: BackgroundContainer(
        color: kOffWhite,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(categories.length, (i) {
              var category = categories[i];
              return CategoryTile(category: category);
            }),
          ),
        ),
      ),
    );
  }
}
