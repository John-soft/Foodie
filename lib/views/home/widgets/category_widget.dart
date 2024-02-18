import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/controllers/category_controller.dart';
import 'package:foodie/models/categories.dart';
import 'package:foodie/views/categories/all_categories.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return GestureDetector(
      onTap: () {
        if (controller.categoryValue == category.id) {
          controller.updateCategory = '';
          controller.updateTitle = '';
        } else if (category.value == 'more') {
          Get.to(() => const AllCategories(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 900));
        } else {
          controller.updateCategory = category.id;
          controller.updateTitle = category.title;
        }
      },
      child: Obx(
        () => Container(
          margin: EdgeInsets.only(right: 5.w),
          padding: EdgeInsets.only(top: 4.h),
          width: width * 0.19,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                  color: controller.categoryValue == category.id
                      ? kSecondary
                      : kOffWhite,
                  width: .5.w)),
          child: Column(
            children: [
              SizedBox(
                height: 35.h,
                child: CachedNetworkImage(
                    imageUrl: category.imageUrl,
                    // placeholder: (BuildContext context, String url) =>
                    //     const CircularProgressIndicator(
                    //       color: Colors.white,
                    //     ),
                    errorWidget:
                        (BuildContext context, String url, dynamic error) =>
                            const Icon(
                              Icons.error,
                            )
                    // fit: BoxFit.contain,
                    ),
              ),
              ReusableText(
                  text: category.title,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: kDark)
            ],
          ),
        ),
      ),
    );
  }
}
