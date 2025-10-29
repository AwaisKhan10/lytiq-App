
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/text_style.dart';
import 'package:lytiq/core/model/my_bet_model.dart';
import 'package:lytiq/ui/custom_widget/buttons/simple_custom_button.dart';

class CustomMyBetsCard extends StatelessWidget {
  final MyBetModel betModel;
  const CustomMyBetsCard({super.key, required this.betModel});
  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'win':
        return ternaryColor;
      case 'lose':
        return redColor;
      case 'active':
        return statusColor;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color statusColor = getStatusColor(betModel.status);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: purpleColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('${betModel.city1}  VS  ${betModel.city2}', style: style16),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: statusColor),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    '${betModel.status}',
                    style: style14.copyWith(
                      fontWeight: FontWeight.w700,
                      color: statusColor,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Text('${betModel.date},${betModel.time}', style: style16),
          10.verticalSpace,
          Text('Stack \$${betModel.stack}', style: style16),
          10.verticalSpace,
          Text(
            'Potential Reward: \$${betModel.potentialReward}',
            style: style16,
          ),
          20.verticalSpace,

          CustomButton(
            onTap: () {
              print('${betModel.buttontext} tapped');
            },
            text: '${betModel.buttontext}',
          ),
        ],
      ),
    );
  }
}
