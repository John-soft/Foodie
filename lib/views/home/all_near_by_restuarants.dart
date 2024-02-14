import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/background_container.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/constants/uidata.dart';
import 'package:foodie/views/home/widgets/restuarant_tile.dart';

class AllNearByRestuarants extends StatelessWidget {
  const AllNearByRestuarants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: kOffWhite,
        title: const ReusableText(
            text: 'Nearby Restuarants',
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: kGray),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: ListView(
            children: List.generate(restaurants.length, (i) {
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
