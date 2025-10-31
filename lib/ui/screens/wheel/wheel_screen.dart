import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:lytiq/core/contant/app_assets.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/text_style.dart';
import 'package:lytiq/ui/custom_widget/custom_scaffold/custom_scaffold.dart';
import 'package:lytiq/ui/screens/select_wheel_coins/select_wheel_coins_screen.dart';
import 'package:lytiq/ui/screens/support/support_view_model.dart';
import 'package:lytiq/ui/screens/wheel/wheel_view_model.dart';
import 'package:provider/provider.dart';

class WheelScreen extends StatelessWidget {
  final String wheelCoins;
  const WheelScreen({super.key, required this.wheelCoins});
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
                100.verticalSpace,
                Center(child: _SpinningWheel(viewModel: viewModel)),
                20.verticalSpace,
                Text(
                  'Basic Wheel',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                  ),
                ),
                SizedBox(height: 20.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _ActionButton(
                          text: 'Growth Wheel',
                          onTap: () {
                            Get.to(SelectWheelCoinsScreen());
                            // viewModel.isSpinning
                            //     ? viewModel.stopSpin()
                            //     : viewModel.startSpin();
                          },
                          color: darkBlurColor,
                          isPrimary: true,
                        ),
                        10.horizontalSpace,
                        _ActionButton(
                          text: viewModel.isSpinning
                              ? '${viewModel.currentTime.inHours.toString().padLeft(2, '0')}:${(viewModel.currentTime.inMinutes.remainder(60)).toString().padLeft(2, '0')}:${(viewModel.currentTime.inSeconds.remainder(60)).toString().padLeft(2, '0')}'
                              : 'Collect Profit',
                          onTap: () {
                            if (!viewModel.isSpinning) {
                              viewModel.startSpin(); // 👈 start 24-hour spin
                            }
                          },
                          color: lightGreenColor,
                        ),
                      ],
                    ),
                  ],
                ),

                15.verticalSpace,
                Text(
                  wheelCoins ?? 'make it correct',
                  style: style16.copyWith(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SpinningWheel extends StatefulWidget {
  final SupportViewModel viewModel;

  const _SpinningWheel({required this.viewModel});

  @override
  State<_SpinningWheel> createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<_SpinningWheel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  static const double _wheelSize = 316.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();

    widget.viewModel.addListener(_handleSpinStateChange);
    if (!widget.viewModel.isSpinning) {
      _controller.stop();
    }
  }

  void _handleSpinStateChange() {
    if (widget.viewModel.isSpinning) {
      _controller.repeat();
    } else {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_handleSpinStateChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSpinning = widget.viewModel.isSpinning;

    return Center(
      child: Container(
        height: _wheelSize.h,
        width: _wheelSize.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: _wheelSize.h,
              width: _wheelSize.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppAssets.wheel),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            AnimatedBuilder(
              animation: _controller,
              child: Image.asset(AppAssets.wheelConeImage),
              builder: (context, child) {
                final rotationAngle = isSpinning
                    ? _controller.value * 2 * 3.14159265359
                    : 0.0;
                return Transform.rotate(
                  angle: rotationAngle,
                  child: Align(
                    alignment: const Alignment(0.0, -1.1),
                    child: SizedBox(width: 34.w, height: 72.h, child: child),
                  ),
                );
              },
            ),

            // Central Gold Coin
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final bool isPrimary;

  const _ActionButton({
    required this.text,
    required this.onTap,
    required this.color,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.r),
          border: isPrimary ? null : Border.all(color: Colors.grey.shade700),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isPrimary ? whiteColor : blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (isPrimary) 10.horizontalSpace,
            if (isPrimary)
              CircleAvatar(
                radius: 10.r,
                backgroundColor: Color(0xff5886B8),
                child: Icon(Icons.add, color: Colors.white, size: 16.sp),
              ),
          ],
        ),
      ),
    );
  }
}

class _TimerOrProfitDisplay extends StatelessWidget {
  final Duration? duration;
  final String? text;
  final Color color;

  const _TimerOrProfitDisplay({this.duration, this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    String displayString = text ?? 'Collect Profit';

    // --- CRITICAL CHANGE 2: Update formatting to HH:MM:SS ---
    if (duration != null) {
      String hours = duration!.inHours.remainder(24).toString().padLeft(2, '0');
      String minutes = duration!.inMinutes
          .remainder(60)
          .toString()
          .padLeft(2, '0');
      String seconds = duration!.inSeconds
          .remainder(60)
          .toString()
          .padLeft(2, '0');

      // Use HH:MM:SS format
      displayString = '$hours:$minutes:$seconds';
    }

    return Container(
      // The original design showed the timer *below* the buttons, not inside
      // Let's ensure the styling matches the image provided in the previous step (Screenshot 1404-08-07 at 17.17.29.png)
      // I will simplify this to a Text widget that is centered, matching the new design.
      child: Text(
        displayString,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 28, // Make the timer large like in the screenshot
        ),
      ),
    );
  }
}
