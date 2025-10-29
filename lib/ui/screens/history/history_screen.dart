import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/text_style.dart';
import 'package:lytiq/core/model/my_bet_model.dart';
import 'package:lytiq/ui/custom_widget/buttons/simple_custom_button.dart';
import 'package:lytiq/ui/custom_widget/custom_scaffold/custom_scaffold.dart';
import 'package:lytiq/ui/custom_widget/my_bet_card.dart';
import 'package:lytiq/ui/screens/history/history_view_model.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HistoryViewModel(),
      child: Consumer<HistoryViewModel>(
        builder: (context, model, child) => CustomScaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
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
                    Text('My Bets', style: style24.copyWith(fontSize: 20.sp)),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.betList.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,

                    itemBuilder: (BuildContext context, int index) {
                      return CustomMyBetsCard(betModel: model.betList[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
