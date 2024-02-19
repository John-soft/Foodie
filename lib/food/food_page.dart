import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/controllers/food_controller.dart';
import 'package:foodie/models/foods_model.dart';
import 'package:get/get.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, required this.food});

  final FoodsModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final foodController = Get.put(FoodController());
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30.r)),
                child: Stack(
                  children: [
                    Container(
                      height: 230.h,
                      color: kGray,
                      child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (i) {
                            foodController.changePage(i);
                          },
                          itemCount: widget.food.imageUrl.length,
                          itemBuilder: (context, index) {
                            print(widget.food.imageUrl.length);
                            return Container(
                              width: width,
                              height: 230.h,
                              color: kLightWhite,
                              child: Image.network(
                                widget.food.imageUrl[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            widget.food.imageUrl.length,
                            (index) {
                              return Container(
                                margin: EdgeInsets.only(left: 12.h),
                                width: 10.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: foodController.currentPage == index
                                        ? kSecondary
                                        : kGrayLight),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 40.h,
                        left: 12.w,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Ionicons.chevron_back_circle,
                            color: kPrimary,
                            size: 30,
                          ),
                        ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
