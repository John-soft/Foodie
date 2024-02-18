import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/models/categories.dart';
import 'package:foodie/views/categories/category_page.dart';
import 'package:get/get.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => const CategoryPage(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 900));
      },
      leading: CircleAvatar(
        radius: 20.r,
        backgroundColor: kGrayLight,
        backgroundImage: NetworkImage(category.imageUrl),
      ),
      title: ReusableText(
        text: category.title,
        fontSize: 12,
        color: kGray,
        fontWeight: FontWeight.normal,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: kGray,
        size: 15.r,
      ),
    );
  }
}
