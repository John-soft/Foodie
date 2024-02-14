import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';

class RestuarantWidget extends StatelessWidget {
  const RestuarantWidget(
      {super.key,
      required this.image,
      required this.logo,
      required this.title,
      required this.time,
      required this.rating,
      required this.onTap});

  final String image;
  final String logo;
  final String title;
  final String time;
  final String rating;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          width: width * 0.75,
          height: 192.h,
          decoration: BoxDecoration(
              color: kLightWhite, borderRadius: BorderRadius.circular(12.r)),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: SizedBox(
                        height: 112.h,
                        width: width * 0.8,
                        child: Image.network(image, fit: BoxFit.fitWidth),
                      ),
                    ),
                    Positioned(
                      right: 10.w,
                      top: 10.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Container(
                          color: kLightWhite,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                              child: Image.network(
                                logo,
                                fit: BoxFit.cover,
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: title,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: kDark,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ReusableText(
                          text: 'Delivery Time',
                          fontWeight: FontWeight.w500,
                          fontSize: 9,
                          color: kGray,
                        ),
                        ReusableText(
                          text: time,
                          fontWeight: FontWeight.w500,
                          fontSize: 9,
                          color: kDark,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                            itemCount: 5,
                            rating: 5,
                            itemSize: 15.h,
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star,
                                color: kPrimary,
                              );
                            }),
                        SizedBox(
                          width: 10.w,
                        ),
                        ReusableText(
                            text: '$rating reviews',
                            fontWeight: FontWeight.w500,
                            fontSize: 9,
                            color: kGray),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
