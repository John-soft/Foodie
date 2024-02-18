import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/custom_appbar.dart';
import 'package:foodie/common/custom_container.dart';
import 'package:foodie/common/heading.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/views/home/all_fastest_foods.dart';
import 'package:foodie/views/home/all_near_by_restuarants.dart';
import 'package:foodie/views/home/recommendations_page.dart';
import 'package:foodie/views/home/widgets/category_list.dart';
import 'package:foodie/views/home/widgets/food_list.dart';
import 'package:foodie/views/home/widgets/nearby_restuarants_list.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: const CustomAppBar(),
      ),
      body: SafeArea(
          child: CustomContainer(
              containerContent: Column(
        children: [
          const CategoryList(),
          Heading(
            text: 'Try Something New',
            onTap: () {
              Get.to(
                () => const RecommendationsPage(),
                transition: Transition.cupertino,
                duration: const Duration(microseconds: 900),
              );
            },
          ),
          const FoodsList(),
          Heading(
            text: 'Nearby Restuarants',
            onTap: () {
              Get.to(
                () => const AllNearByRestuarants(),
                transition: Transition.cupertino,
                duration: const Duration(microseconds: 900),
              );
            },
          ),
          const NearbyRestuarants(),
          Heading(
            text: 'Fastest food closer to you',
            onTap: () {
              Get.to(
                () => const AllFastestFoods(),
                transition: Transition.cupertino,
                duration: const Duration(microseconds: 900),
              );
            },
          ),
          const FoodsList(),
        ],
      ))),
    );
  }
}
