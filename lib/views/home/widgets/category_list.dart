import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/shimmers/categories_shimmer.dart';
import 'package:foodie/hooks/fetch_categories.dart';
import 'package:foodie/models/categories.dart';
import 'package:foodie/views/home/widgets/category_widget.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});
  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CategoryModel>? categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    //final error = hookResult.error;
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(left: 18.w, top: 10.h),
      child: isLoading
          ? const CatergoriesShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(categoriesList!.length, (index) {
                var category = categoriesList[index];
                return CategoryWidget(category: category);
              }),
            ),
    );
  }
}
