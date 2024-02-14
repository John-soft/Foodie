import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.time,
      required this.price,
      required this.onTap});

  final String image;
  final String title;
  final String time;
  final String price;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          width: width * 0.75,
          height: 180.h,
          decoration: BoxDecoration(
              color: kLightWhite, borderRadius: BorderRadius.circular(12.r)),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(8.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: SizedBox(
                    height: 112.h,
                    width: width * 0.8,
                    child: Image.network(image, fit: BoxFit.fitWidth),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: title,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: kDark,
                        ),
                        ReusableText(
                          text: '\$$price',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: kPrimary,
                        ),
                      ],
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
