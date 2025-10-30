import 'package:flutter/material.dart';
import 'package:lytiq/admin_panel/betting_and_settelment_page/betting_settelment_view_model.dart';
import 'package:lytiq/admin_panel/live_matches_control/live_matches_view_model.dart';
import 'package:lytiq/admin_panel/user_managments/user_managements_view_model.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:provider/provider.dart';

class BettingSettlementScreen extends StatelessWidget {
  const BettingSettlementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BettingSettlementViewModel(),
      child: Consumer<BettingSettlementViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: primaryColor,
          body: SafeArea(
            child: Column(
              children: [
                Text(
                  '  BettingSettlementViewModel',
                  style: TextStyle(color: whiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
