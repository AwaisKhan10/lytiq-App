// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/strings.dart';
import 'package:lytiq/core/contant/text_style.dart';
import 'package:lytiq/ui/custom_widget/custom_scaffold/custom_scaffold.dart';
import 'package:lytiq/ui/screens/match_detail_screen/match_detail_screen.dart';
import 'package:lytiq/ui/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:lytiq/ui/screens/home/home_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) {
          return CustomScaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ---- Header Section ----
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(ProfileScreen());
                                },
                                child: const CircleAvatar(
                                  radius: 26,
                                  backgroundImage: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVpcCcQNUGyTpt1jjsWPZVrdEvPHO3kr7Tdg&s',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Welcome",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "Awais khan",
                                    style: TextStyle(
                                      color: greyColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text("LYTIQ", style: style16Baloo),

                          ///
                          /// Coins
                          ///
                          _coins(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// ---- Banners Carousel ----
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 160,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                      ),
                      items: model.banners.map((banner) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            banner,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    /// ---- Tabs ----
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildTab(model, "Top Events", 0),
                        _buildTab(model, "Upcoming", 1),
                        _buildTab(model, "Live", 2),
                      ],
                    ),

                    30.verticalSpace,

                    /// ---- Match Cards ----
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: model.filteredMatches.length,

                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final match = model.filteredMatches[index];

                        return GestureDetector(
                          onTap: () {
                            Get.to(MatchDetailScreen(matchIndex: index));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF161233),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// League logo
                                Image.asset(
                                  match.leagueAsset ??
                                      '$dynamicAssets/laliga.png',
                                  scale: 3,
                                ),
                                const SizedBox(height: 10),

                                /// --- Match Row ---
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// Team 1
                                    Flexible(
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundImage: AssetImage(
                                              match.team1Logo ?? "",
                                            ),
                                          ),
                                          10.verticalSpace,
                                          Text(
                                            match.team1Name ?? "",
                                            style: style10.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    60.horizontalSpace,

                                    /// Score + Status + Time
                                    Column(
                                      children: [
                                        Text(
                                          match.score ?? "1 - 0",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.green.withOpacity(
                                              0.2,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Text(
                                            match.status == 'Upcoming'
                                                ? (match.time ?? '')
                                                : (match.status ?? ''),
                                            style: TextStyle(
                                              color: statusColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        const SizedBox(height: 15.0),
                                        match.status == 'Upcoming'
                                            ? Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.timer,
                                                    color: whiteColor,
                                                  ),
                                                  5.horizontalSpace,
                                                  Text(
                                                    'Reminder',
                                                    style: style10.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Text(
                                                match.time ?? "90+",
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13,
                                                ),
                                              ),
                                      ],
                                    ),
                                    const SizedBox(width: 20),

                                    /// Team 2
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundImage: AssetImage(
                                              match.team2Logo ?? "",
                                            ),
                                          ),
                                          10.verticalSpace,
                                          Text(
                                            match.team2Name ?? "",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.right,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 16),

                                /// --- Betting Odds Row ---
                                match.status == 'Upcoming'
                                    ? SizedBox()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _oddBox(
                                            label: "W1",
                                            value: "2.912",
                                            locked: true,
                                          ),
                                          _oddBox(
                                            label: "X",
                                            value: "3.2",
                                            locked: true,
                                          ),
                                          _oddBox(
                                            label: "W2",
                                            value: "2.512",
                                            locked: true,
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Helper Widget for betting box
  Widget _oddBox({
    required String label,
    required String value,
    bool locked = false,
  }) {
    return Stack(
      alignment: Alignment.topRight,
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: greyColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Text(value, style: const TextStyle(color: blackColor)),
            ],
          ),
        ),
        if (locked) ...[
          const SizedBox(width: 4),
          Positioned(
            top: -6,
            child: CircleAvatar(
              backgroundColor: Color(0xffD9D9D9),
              foregroundColor: Color(0xffD9D9D9),
              radius: 10,
              child: const Icon(Icons.lock, size: 12, color: Color(0xff6A6262)),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTab(
    HomeViewModel model,
    String title,
    int index, {
    bool hasDot = false,
  }) {
    final isActive = model.selectedTab == index;

    return GestureDetector(
      onTap: () => model.changeTab(index),
      child: Column(
        children: [
          Row(
            children: [
              if (title == "Live")
                CircleAvatar(
                  radius: 4,
                  backgroundColor: isActive
                      ? amberColor
                      : amberColor.withOpacity(0.4),
                ),
              if (title == "Live") 5.horizontalSpace,
              Text(
                title,
                style: TextStyle(
                  color: isActive ? Colors.white : greyColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: title == "Live" ? 60 : 100, // little wider for Live
              color: amberColor,
            ),
        ],
      ),
    );
  }
}

_coins() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(colors: [Color(0xff1D88CC), Color(0xff126235)]),
      border: Border.all(color: Colors.greenAccent),
    ),
    child: Row(
      children: const [
        Icon(Icons.monetization_on, color: amberColor, size: 20),
        SizedBox(width: 6),
        Text(
          "1,350",
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
