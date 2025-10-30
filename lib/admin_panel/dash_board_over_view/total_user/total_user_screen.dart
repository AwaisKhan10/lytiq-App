import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:lytiq/admin_panel/dash_board_over_view/total_user/total_user_view_model.dart';
import 'package:lytiq/core/contant/app_assets.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/text_style.dart';
import 'package:lytiq/ui/custom_widget/custom_scaffold/custom_scaffold.dart';
import 'package:provider/provider.dart';

class TotalUserScreen extends StatelessWidget {
  const TotalUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TotalUserViewModel(),
      child: Consumer<TotalUserViewModel>(
        builder: (context, model, child) => CustomScaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  10.verticalSpace,

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: whiteColor,
                          size: 20,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),

                      10.0.horizontalSpace,
                      Text(
                        'Total Users',
                        style: style24.copyWith(fontSize: 20.sp),
                      ),
                    ],
                  ),
                  30.verticalSpace,
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_rounded, color: whiteColor),
                      hintText: 'Search by name',
                      hintStyle: style14,
                      labelStyle: const TextStyle(color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white24),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: blueColor),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF2A2E57),
                    ),
                  ),
                  20.verticalSpace,
                  Expanded(
                    child: ListView.builder(
                      itemCount: 30,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 20.r,
                                  backgroundImage: AssetImage(
                                    AppAssets.appLogo,
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  "user name",
                                  style: style14.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  "Total Coins: \$2000",
                                  style: style14.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.delete_rounded,
                                    color: redColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
