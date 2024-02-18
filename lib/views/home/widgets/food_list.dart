import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/shimmers/nearby_shimmer.dart';
import 'package:foodie/hooks/fetch_foods.dart';
import 'package:foodie/models/foods_model.dart';
import 'package:foodie/views/home/widgets/food_widget.dart';

class FoodsList extends HookWidget {
  const FoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoods("41007428");
    List<FoodsModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    return isLoading
        ? const NearbyShimmer()
        : Container(
            height: 184.h,
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(foods!.length, (i) {
                FoodsModel food = foods[i];
                return FoodWidget(
                  image: food.imageUrl,
                  title: food.title,
                  time: food.time,
                  price: food.price.toStringAsFixed(2),
                  onTap: () {},
                );
              }),
            ),
          );
  }
}
