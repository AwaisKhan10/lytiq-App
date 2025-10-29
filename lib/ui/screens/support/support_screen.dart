import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lytiq/core/contant/app_assets.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/text_style.dart';
import 'package:lytiq/ui/custom_widget/custom_scaffold/custom_scaffold.dart';
import 'package:lytiq/ui/screens/support/support_view_model.dart';
import 'package:provider/provider.dart';

class SupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SupportViewModel(),
      child: Consumer<SupportViewModel>(
        builder: (context, viewModel, child) => CustomScaffold(
          showAppBar: true,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                40.verticalSpace,
                Text(
                  'Support Center',
                  style: style10.copyWith(fontSize: 32.sp),
                ),
                5.verticalSpace,
                Text(
                  'Need help? Our team is always live!',
                  style: style16.copyWith(),
                ),
                40.verticalSpace,
                customSupportCenterWidget(
                  AppAssets.a,
                  'Whatsapp',
                  'Get help via Whatsapp\nin seconds.',
                ),
                30.verticalSpace,
                customSupportCenterWidget(
                  AppAssets.b,
                  'ive Support',
                  'Chat instantly with our\nsupport team..',
                ),
                30.verticalSpace,
                customSupportCenterWidget(
                  AppAssets.c,
                  'Telegram',
                  'Join our Telegram\nsupport chat.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container customSupportCenterWidget(String image, String tittle, String dec) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: statusColor2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 80.h,
              width: 80.w,
              child: Image.asset(image, scale: 4, fit: BoxFit.cover),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(tittle, style: style24),
                Text(
                  dec,
                  style: style12.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
