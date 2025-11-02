import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:lytiq/core/contant/app_assets.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/text_style.dart';
import 'package:lytiq/ui/custom_widget/buttons/simple_custom_button.dart';
import 'package:lytiq/ui/custom_widget/custom_scaffold/custom_scaffold.dart';
import 'package:lytiq/ui/screens/root/root_screen.dart';
import 'package:lytiq/ui/screens/select_wheel_coins/select_wheel_coins_view_model.dart';
import 'package:lytiq/ui/screens/wheel/wheel_screen.dart';
import 'package:provider/provider.dart';

class SelectWheelCoinsScreen extends StatelessWidget {
  const SelectWheelCoinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectWheelCoinsViewModel(),
      child: Consumer<SelectWheelCoinsViewModel>(
        builder: (context, model, child) => CustomScaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  30.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 32.h, width: 95.w),
                      Text('LYTIQ', style: style24),

                      Container(
                        height: 32.h,
                        width: 95.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          gradient: LinearGradient(
                            colors: [blueColor, lightGreenColor],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                              ),
                              height: 26.h,
                              width: 26.w,
                              child: Image(image: AssetImage(AppAssets.coin)),
                            ),
                            Text(
                              '4619',
                              style: style16.copyWith(color: ternaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  50.verticalSpace,
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 20,
                          ),
                      itemCount: 6,

                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomSelectWheelCoinsCard(
                          onTap: () {
                            _showConfirmationDialog(context, model, index);
                            // Get.to(
                            //   WheelScreen(
                            //     wheelCoins:
                            //         model.selectWheelCoinsList[index].text,
                            //   ),
                            // );
                          },
                          coins: model.selectWheelCoinsList[index],
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

///
///. confirmation popUp
///

void _showConfirmationDialog(
  BuildContext context,
  SelectWheelCoinsViewModel model,
  index,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        backgroundColor: statusColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.cancel, color: blackColor, size: 30),
              ),
              10.verticalSpace,

              Center(
                child: Text(
                  model.selectWheelCoinsList[index].coins,
                  style: style18.copyWith(),
                ),
              ),
              10.verticalSpace,
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model.selectWheelCoinsList[index].text,
                      style: style18.copyWith(),
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(AppAssets.coin),
                    ),
                  ],
                ),
              ),
              10.verticalSpace,
              CustomButton(
                color: ternaryColor,
                text: "Buy",
                onTap: () {
                  // Navigator.pop(context);
                  // navigator!.pop(context);
                  Get.offAll(
                    WheelScreen(
                      wheelCoins: model.selectWheelCoinsList[index].text,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

///
/// model
///
class SelectWheelCoinsModel {
  final String coins;
  final String text;
  SelectWheelCoinsModel({required this.coins, required this.text});
}

///
///. custom widget
///
class CustomSelectWheelCoinsCard extends StatelessWidget {
  final SelectWheelCoinsModel coins;
  final VoidCallback onTap;
  const CustomSelectWheelCoinsCard({
    super.key,
    required this.coins,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff050610), Color(0xff252C76)],
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 110.h,
              width: 104.w,
              child: Image.asset(
                AppAssets.wheelImage2,
                scale: 4,
                fit: BoxFit.cover,
              ),
            ),
            15.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(coins.coins, style: style24.copyWith(fontSize: 20.sp)),
                4.horizontalSpace,
                SizedBox(
                  height: 31.h,
                  width: 31.w,
                  child: Image(image: AssetImage(AppAssets.coin)),
                ),
              ],
            ),
            15.verticalSpace,
            Container(
              height: 32,
              width: double.infinity,
              decoration: BoxDecoration(
                color: blackColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Center(child: Text(coins.text, style: style10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
