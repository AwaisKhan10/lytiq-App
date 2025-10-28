import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:lytiq/core/contant/app_assets.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/text_style.dart';
import 'package:lytiq/ui/custom_widget/custom_scaffold/custom_scaffold.dart';
import 'package:lytiq/ui/screens/home/home_view_model.dart';
import 'package:provider/provider.dart';

class MatchDetailScreen extends StatelessWidget {
  final int matchIndex;

  const MatchDetailScreen({super.key, required this.matchIndex});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screeHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) {
          final match = model.matches[matchIndex];

          return CustomScaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ---------------- HEADER ----------------
                    Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(match.groundImage ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: whiteColor,
                                ),
                              ),
                              10.horizontalSpace,
                              Text(
                                'Match Details',
                                style: style24.copyWith(fontSize: 20),
                              ),
                            ],
                          ),
                          20.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: whiteColor.withOpacity(0.7),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Round 2. LaLiga",
                                    style: style12.copyWith(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 28,
                                            backgroundImage: AssetImage(
                                              match.team1Logo ?? '',
                                            ),
                                          ),
                                          6.verticalSpace,
                                          Text(
                                            match.team1Name ?? "",
                                            style: style14.copyWith(
                                              color: whiteColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "VS",
                                        style: style24.copyWith(
                                          color: whiteColor,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 28,
                                            backgroundImage: AssetImage(
                                              match.team2Logo ?? '',
                                            ),
                                          ),
                                          6.verticalSpace,
                                          Text(
                                            match.team2Name ?? "",
                                            style: style14.copyWith(
                                              color: whiteColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  12.verticalSpace,
                                  Text(
                                    "Starts in",
                                    style: style14.copyWith(color: whiteColor),
                                  ),
                                  6.verticalSpace,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      _TimeBox(value: "05"),
                                      SizedBox(width: 6),
                                      _TimeBox(value: "24"),
                                      SizedBox(width: 6),
                                      _TimeBox(value: "23"),
                                    ],
                                  ),
                                  80.verticalSpace,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    25.verticalSpace,

                    /// ---------------- ODDS SECTIONS ----------------
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            _BettingSection(
                              title: "1 X 2",

                              options: [
                                {"label": "W1", "value": "3.01"},
                                {"label": "X", "value": "3.01"},
                                {"label": "W2", "value": "2.575"},
                              ],
                            ),
                            _BettingSection(
                              title: "Double Chance",
                              options: [
                                {"label": "1X", "value": "1.535"},
                                {"label": "12", "value": "1.418"},
                                {"label": "2X", "value": "1.418"},
                              ],
                            ),
                            _BettingSection(
                              title: "Both Teams To Score",
                              options: [
                                {"label": "Yes", "value": "2.03"},
                                {"label": "No", "value": "1.717"},
                              ],
                            ),
                            _BettingSection(
                              title: "Penalty Awarded",
                              options: [
                                {"label": "Yes", "value": "3.15"},
                                {"label": "No", "value": "1.34"},
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    40.verticalSpace,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// ---------------- SMALL WIDGETS ----------------

class _TimeBox extends StatelessWidget {
  final String value;
  const _TimeBox({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        value,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _BettingSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> options;

  const _BettingSection({required this.title, required this.options});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: style24.copyWith(fontSize: 20, color: whiteColor),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  print('pin tap');
                },
                child: Image.asset(AppAssets.pinIcon, scale: 4),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_up,
                  color: whiteColor,
                  weight: 20,
                  size: 50,
                ),
              ),
            ],
          ),
          12.verticalSpace,
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: options.map((opt) {
              return Container(
                width:
                    (MediaQuery.of(context).size.width - 52) /
                    (options.length == 3 ? 3 : 2),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      opt['label'] ?? '',
                      style: style16.copyWith(color: lightGreyColor),
                    ),
                    4.verticalSpace,
                    Text(
                      opt['value'] ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
