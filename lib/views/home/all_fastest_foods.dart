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

class AllFastestFoods extends HookWidget {
  const AllFastestFoods({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllFoods("41007428");
    List<FoodsModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: kSecondary,
        title: const ReusableText(
          text: 'Fastest Foods',
          fontWeight: FontWeight.w600,
          fontSize: 13,
          color: kWhite,
        ),
      ),
      body: isLoading
          ? const FoodsListShimmer()
          : BackgroundContainer(
              color: Colors.white,
              child: Padding(
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
            ),
    );
  }
}
