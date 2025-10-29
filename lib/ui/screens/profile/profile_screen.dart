import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lytiq/core/contant/app_assets.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/text_style.dart';
import 'package:lytiq/ui/custom_widget/custom_scaffold/custom_scaffold.dart';
import 'package:lytiq/ui/screens/profile/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(),
      child: Consumer(
        builder: (context, model, child) => CustomScaffold(
          body: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                30.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: whiteColor,
                      size: 20,
                    ),

                    7.0.horizontalSpace,
                    Text(
                      'My Account',
                      style: style24.copyWith(fontSize: 20.sp),
                    ),
                  ],
                ),
                30.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(18.r),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [linearColor1, linearColor2, linearColor3],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Icon(
                          Icons.mode_edit_outline_outlined,
                          color: whiteColor,
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 120.w,
                          height: 107,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: whiteColor, width: 2.7),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVpcCcQNUGyTpt1jjsWPZVrdEvPHO3kr7Tdg&s',
                              ),
                            ),
                          ),
                        ),
                      ),
                      15.verticalSpace,
                      Center(
                        child: Text(
                          'John Hills',
                          style: style24.copyWith(fontSize: 20.sp),
                        ),
                      ),
                      0.verticalSpace,
                      Center(
                        child: Text(
                          '@user id\n99xxxxxxxx',
                          style: style24.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                20.verticalSpace,
                Text(
                  'Profile completion:100%',
                  style: style16.copyWith(fontWeight: FontWeight.w500),
                ),
                8.verticalSpace,
                Container(
                  height: 5.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36.r),
                    color: progressBarColor,
                  ),
                ),
                15.verticalSpace,
                myAccountFunctions(
                  AppAssets.paintIcon,
                  'Theme',
                  borderColor,
                  onTap: () {},
                ),
                myAccountFunctions(
                  AppAssets.badgeIcon,
                  'Rewards',
                  borderColor,
                  onTap: () {},
                ),
                myAccountFunctions(
                  onTap: () {},
                  AppAssets.settingIcon,
                  'Setting',
                  borderColor,
                ),
                myAccountFunctions(
                  onTap: () {},
                  AppAssets.logOutIcon,
                  'LogOut',
                  Color(0xff4A2588),
                  customColors: [
                    Color(0xff261A54),
                    Color(0xff1B113F),
                    Color(0xff1B113F),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  myAccountFunctions(
    image,
    text,
    borderClr, {
    List<Color>? customColors,
    onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: borderClr),
          borderRadius: BorderRadius.circular(18.r),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: customColors ?? [linearColor1, linearColor2, linearColor3],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            20.horizontalSpace,
            SizedBox(height: 26, width: 26, child: Image.asset(image)),
            20.horizontalSpace,
            Text(text, style: style24.copyWith(fontSize: 20.sp)),
          ],
        ),
      ),
    );
  }
}
