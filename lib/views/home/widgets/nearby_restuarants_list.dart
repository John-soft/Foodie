import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/shimmers/nearby_shimmer.dart';
import 'package:foodie/hooks/fetch_restaurants.dart';
import 'package:foodie/models/restuarant_model.dart';
import 'package:foodie/views/home/widgets/restuarant_widget.dart';

class NearbyRestuarants extends HookWidget {
  const NearbyRestuarants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurants("41007428");
    List<RestuarantModel>? restaurantList = hookResults.data;
    final isLoading = hookResults.isLoading;
    return isLoading
        ? const NearbyShimmer()
        : Container(
            height: 190.h,
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(restaurantList!.length, (index) {
                var restaurant = restaurantList[index];
                return RestuarantWidget(
                  image: restaurant.imageUrl,
                  logo: restaurant.logoUrl,
                  title: restaurant.title,
                  time: restaurant.time,
                  rating: restaurant.rating.toString(),
                  onTap: () {},
                );
              }),
            ),
          );
  }
}
