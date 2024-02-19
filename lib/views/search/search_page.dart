import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie/common/custom_container.dart';
import 'package:foodie/common/custom_text_field.dart';
import 'package:foodie/common/shimmers/foodlist_shimmer.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/controllers/search_controller.dart';
import 'package:foodie/views/search/loading_widget.dart';
import 'package:foodie/views/search/search_results.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Obx(
      () => Scaffold(
        backgroundColor: kPrimary,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 74.h,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: CustomTextField(
              controller: _searchController,
              hintText: "Search for foods",
              keyboardType: TextInputType.text,
              suffixIcon: GestureDetector(
                onTap: () {
                  if (controller.searchResults == null) {
                    controller.searchFoods(_searchController.text);
                  } else {
                    controller.searchResults == null;
                    _searchController.clear();
                  }
                },
                child: Icon(
                  controller.searchResults != null
                      ? Ionicons.search_circle
                      : Ionicons.close_circle,
                  size: 40.h,
                  color: kPrimary,
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: CustomContainer(
            color: Colors.white,
            containerContent: controller.isLoading
                ? const FoodsListShimmer()
                : controller.searchResults == null
                    ? const LoadingWidget()
                    : const SearchResults(),
          ),
        ),
      ),
    );
  }
}
