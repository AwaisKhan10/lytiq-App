import 'package:flutter/cupertino.dart';
import 'package:lytiq/admin_panel/dash_board_over_view/active_user/active_user_screen.dart';
import 'package:lytiq/admin_panel/dash_board_over_view/dash_board_overView_screen.dart';
import 'package:lytiq/admin_panel/dash_board_over_view/total_user/total_user_screen.dart';
import 'package:lytiq/core/others/base_view_model.dart';

class DashBoardOverViewViewModel extends BaseViewModel {
  final List<String> dashBoardOverViewCategoriesList = [
    'Total of users',
    'Active users',
    'Total coins',
    'Active wheels',
  ];
  final List<Widget> dashBoardOverViewCategoriesScreenList = [
    TotalUserScreen(),
    ActiveUserScreen(),
    TotalCoinsScreen(),
    ActiveWheelsScreen(),
  ];
}
