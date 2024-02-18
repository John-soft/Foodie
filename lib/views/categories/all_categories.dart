import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/background_container.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/common/shimmers/categories_shimmer.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/hooks/fetch_all_categories.dart';
import 'package:foodie/models/categories.dart';
import 'package:foodie/views/categories/widget/category_tile.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});
  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllCategories();
    List<CategoryModel>? categoriesList = hookResults.data;
    final isLoading = hookResults.isLoading;
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
          child: isLoading
              ? const CatergoriesShimmer()
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(categoriesList!.length, (i) {
                    var category = categoriesList[i];
                    return CategoryTile(category: category);
                  }),
                ),
        ),
      ),
    );
  }
}
