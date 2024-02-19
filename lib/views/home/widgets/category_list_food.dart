import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/shimmers/foodlist_shimmer.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/hooks/fetch_category_food.dart';
import 'package:foodie/models/foods_model.dart';
import 'package:foodie/views/home/widgets/food_tile.dart';

class CategoryFoodsList extends HookWidget {
  const CategoryFoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoodsByCategory("41007428");
    List<FoodsModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    return SizedBox(
      height: height,
      width: width,
      child: isLoading
          ? const FoodsListShimmer()
          : Padding(
              padding: EdgeInsets.all(12.h),
              child: ListView(
                children: List.generate(foods!.length, (i) {
                  var food = foods[i];
                  return FoodTile(
                    color: Colors.white,
                    food: food,
                  );
                }),
              ),
            ),
    );
  }
}
