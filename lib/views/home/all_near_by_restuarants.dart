import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/background_container.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/common/shimmers/foodlist_shimmer.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/hooks/fetch_all_restaurants.dart';
import 'package:foodie/models/restuarant_model.dart';
import 'package:foodie/views/home/widgets/restuarant_tile.dart';

class AllNearByRestuarants extends HookWidget {
  const AllNearByRestuarants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllRestaurants("41007428");
    List<RestuarantModel>? restaurants = hookResult.data;
    final isLoading = hookResult.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: kSecondary,
        title: const ReusableText(
            text: 'Nearby Restuarants',
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: kOffWhite),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: isLoading
            ? const FoodsListShimmer()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: ListView(
                  children: List.generate(restaurants!.length, (i) {
                    var restuarant = restaurants[i];
                    return RestuarantTile(
                      restaurant: restuarant,
                    );
                  }),
                ),
              ),
      ),
    );
  }
}
