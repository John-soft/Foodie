import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/models/foods_model.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.food,
    this.color,
  });

  final FoodsModel food;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8.h),
              height: 70.h,
              width: width,
              decoration: BoxDecoration(
                color: color ?? kOffWhite,
                borderRadius: BorderRadius.circular(9.r),
              ),
              child: Container(
                padding: EdgeInsets.all(4.r),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 70.h,
                            width: 70.h,
                            child: CachedNetworkImage(
                              imageUrl: food.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              child: Container(
                                padding:
                                    EdgeInsets.only(left: 6.w, bottom: 2.h),
                                color: kGray.withOpacity(0.6),
                                height: 16.h,
                                width: width,
                                child: RatingBarIndicator(
                                  rating: 5,
                                  itemSize: 15.h,
                                  itemCount: 5,
                                  itemBuilder: (context, i) => const Icon(
                                    Icons.star,
                                    color: kSecondary,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: food.title,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: kDark,
                        ),
                        ReusableText(
                          text: 'Delivery Time : ${food.time}',
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: kGray,
                        ),
                        SizedBox(
                          width: width * 0.7,
                          height: 15.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: food.additives.length,
                              itemBuilder: (context, index) {
                                var additive = food.additives[index];

                                return Container(
                                  margin: EdgeInsets.only(right: 5.w),
                                  decoration: BoxDecoration(
                                      color: kSecondaryLight,
                                      borderRadius: BorderRadius.circular(9.r)),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(2.h),
                                      child: ReusableText(
                                          text: additive.title,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 8,
                                          color: kGray),
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 5.w,
              top: 6.h,
              child: Container(
                width: 60.w,
                height: 19.h,
                decoration: BoxDecoration(
                    color: kPrimary, borderRadius: BorderRadius.circular(10.r)),
                child: Center(
                  child: ReusableText(
                    text: '\$${food.price.toStringAsFixed(2)}',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: kLightWhite,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 75.w,
              top: 6.h,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 19.w,
                  height: 19.h,
                  decoration: BoxDecoration(
                      color: kSecondary,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Center(
                    child: Icon(
                      MaterialCommunityIcons.cart_plus,
                      size: 15.h,
                      color: kLightWhite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
