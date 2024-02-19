import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/background_container.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/common/shimmers/foodlist_shimmer.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/controllers/category_controller.dart';
import 'package:foodie/hooks/fetch_category_food.dart';
import 'package:foodie/models/foods_model.dart';
import 'package:foodie/views/home/widgets/food_tile.dart';
import 'package:get/get.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookResult = useFetchFoodsByCategory("41007428");
    List<FoodsModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                controller.updateCategory = '';
                controller.updateTitle = '';
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kGray,
              )),
          elevation: 0,
          backgroundColor: kOffWhite,
          title: ReusableText(
              text: '${controller.titleValue} category',
              fontWeight: FontWeight.w600,
              fontSize: 11,
              color: kGray),
        ),
        body: BackgroundContainer(
          color: Colors.white,
          child: isLoading
              ? const FoodsListShimmer()
              : Padding(
                  padding: EdgeInsets.all(12.h),
                  child: ListView(
                    children: List.generate(foods!.length, (i) {
                      var food = foods[i];
                      return FoodTile(
                        food: food,
                      );
                    }),
                  ),
                ),
        ));
  }
}
