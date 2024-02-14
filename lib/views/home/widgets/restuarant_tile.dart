import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/reusable_text.dart';
import 'package:foodie/constants/constants.dart';

class RestuarantTile extends StatelessWidget {
  const RestuarantTile({super.key, this.restaurant});

  final dynamic restaurant;

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
                color: kOffWhite,
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
                            child: Image.network(
                              restaurant['imageUrl'],
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
                          text: restaurant['title'],
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: kDark,
                        ),
                        ReusableText(
                          text: 'Delivery Time : ${restaurant['time']}',
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: kGray,
                        ),
                        SizedBox(
                          width: width * 0.7,
                          child: Text(
                            restaurant['coords']['address'],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 9,
                                color: kGray,
                                fontWeight: FontWeight.w400),
                          ),
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
                    color: restaurant['isAvailable'] == true ||
                            restaurant['isAvailable'] == null
                        ? kPrimary
                        : kSecondaryLight,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Center(
                  child: ReusableText(
                    text: restaurant['isAvailable'] == true ||
                            restaurant['isAvailable'] == null
                        ? 'Open'
                        : 'Closed',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: kLightWhite,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
