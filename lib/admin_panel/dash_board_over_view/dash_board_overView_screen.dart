import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:lytiq/admin_panel/dash_board_over_view/dash_board_over_view_viewModel.dart';
import 'package:lytiq/core/contant/text_style.dart';
import 'package:lytiq/ui/custom_widget/admin_panel/over_view_screen_card.dart';
import 'package:lytiq/ui/custom_widget/custom_scaffold/custom_scaffold.dart';
import 'package:provider/provider.dart';

class DashBoardOverViewScreen extends StatelessWidget {
  const DashBoardOverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashBoardOverViewViewModel(),
      child: Consumer<DashBoardOverViewViewModel>(
        builder: (context, model, child) => SafeArea(
          child: CustomScaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomDashBoardOverViewUserCard(
                        onTap: () {
                          Get.to(
                            model.dashBoardOverViewCategoriesScreenList[index],
                          );
                        },
                        text: model.dashBoardOverViewCategoriesList[index],
                      );
                    },
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
///  total users class
///
// class TotalUserScreen extends StatelessWidget {
//   const TotalUserScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => DashBoardOverViewViewModel(),
//       child: Consumer<DashBoardOverViewViewModel>(
//         builder: (context, model, child) => CustomScaffold(
//           body: SafeArea(
//             child: Center(child: Text('total user', style: style24)),
//           ),
//         ),
//       ),
//     );
//   }
// }

///
///  active users class
///
// class ActiveUsersScreen extends StatelessWidget {
//   const ActiveUsersScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => DashBoardOverViewViewModel(),
//       child: Consumer<DashBoardOverViewViewModel>(
//         builder: (context, model, child) => CustomScaffold(
//           body: SafeArea(
//             child: Center(child: Text('Active Users', style: style24)),
//           ),
//         ),
//       ),
//     );
//   }
// }

///
///   total coins screen
///
class TotalCoinsScreen extends StatelessWidget {
  const TotalCoinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashBoardOverViewViewModel(),
      child: Consumer<DashBoardOverViewViewModel>(
        builder: (context, model, child) => CustomScaffold(
          body: SafeArea(
            child: Center(child: Text('Total Coins Screen', style: style24)),
          ),
        ),
      ),
    );
  }
}

///
///   total coins screen
///
class ActiveWheelsScreen extends StatelessWidget {
  const ActiveWheelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashBoardOverViewViewModel(),
      child: Consumer<DashBoardOverViewViewModel>(
        builder: (context, model, child) => CustomScaffold(
          body: SafeArea(
            child: Center(child: Text('Active Wheels Screen', style: style24)),
          ),
        ),
      ),
    );
  }
}
