import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie/common/custom_appbar.dart';
import 'package:foodie/common/custom_container.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/views/home/widgets/category_list.dart';

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
      body: const SafeArea(
          child: CustomContainer(
              containerContent: Column(
        children: [CategoryList()],
      ))),
    );
  }
}
