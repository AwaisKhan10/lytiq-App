import 'package:flutter/material.dart';
import 'package:lytiq/admin_panel/live_matches_control/live_matches_view_model.dart';
import 'package:lytiq/admin_panel/user_managments/user_managements_view_model.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:provider/provider.dart';

class UserManagementsScreen extends StatelessWidget {
  const UserManagementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserManagementsViewModel(),
      child: Consumer<UserManagementsViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: primaryColor,
          body: SafeArea(
            child: Column(
              children: [
                Text(
                  'user management control screen',
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
