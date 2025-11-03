// ...existing code...
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lytiq/core/contant/app_assets.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/ui/custom_widget/custom_scaffold/custom_scaffold.dart';
import 'package:lytiq/ui/screens/games/games_screen.dart';
import 'package:lytiq/ui/screens/history/history_screen.dart';
import 'package:lytiq/ui/screens/home/home_screen.dart';
import 'package:lytiq/ui/screens/select_wheel_coins/select_wheel_coins_screen.dart';
import 'package:lytiq/ui/screens/support/support_screen.dart';
import 'package:lytiq/ui/screens/wheel/wheel_screen.dart';
import 'package:lytiq/ui/screens/wheel/wheel_view_model.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key, this.initialIndex = 0}) : super(key: key);

  // Allows navigation to root with a selected tab (used after upgrade)
  final int initialIndex;

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  // final WheelViewModel model;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  List<Widget> get _screens => [
        HomeScreen(),
        GamesScreen(),
        // Build WheelScreen dynamically so it reflects updates from the shared ViewModel
        WheelScreen(wheelCoins: WheelViewModel.instance.selectedWheelText),
        HistoryScreen(),
        SupportScreen(),
      ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    // Provide the shared WheelViewModel to the subtree so consumers can listen for changes.
    return ChangeNotifierProvider<WheelViewModel>.value(
      value: WheelViewModel.instance,
      child: CustomScaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: Container(
          color: secondaryColor,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              // Bottom bar background
              Container(
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: 100,
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNavItem(AppAssets.homeIcon, "Home", 0),
                      _buildNavItem(AppAssets.gamesIcon, "Games", 1),
                      const SizedBox(width: 70), // space for center button
                      _buildNavItem(AppAssets.historyIcon, "History", 3),
                      _buildNavItem(AppAssets.supportIcon, "Support", 4),
                    ],
                  ),
                ),
              ),

              // Floating center wheel button
              Positioned(
                top: -35, // half outside
                child: GestureDetector(
                  onTap: () => _onItemTapped(2),
                  child: Column(
                    children: [
                      Image.asset(AppAssets.wheelIcon, scale: 3.4),
                      10.verticalSpace,
                      Text(
                        "Wheel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String img, String label, int index) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // White line indicator — inside bar only
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: isSelected ? 3 : 0,
            width: 24,
            margin: const EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Image.asset(
            img,
            scale: 3,
            color: isSelected ? Colors.white : Colors.white70,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
