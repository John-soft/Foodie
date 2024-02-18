import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/background_container.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/common/shimmers/foodlist_shimmer.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/hooks/fetch_all_foods.dart';
import 'package:foodie/models/foods_model.dart';
import 'package:foodie/views/home/widgets/food_tile.dart';

class RecommendationsPage extends HookWidget {
  const RecommendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllFoods("41007428");
    List<FoodsModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kSecondary,
          title: const ReusableText(
            text: 'Recommendations',
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: kOffWhite,
          ),
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
