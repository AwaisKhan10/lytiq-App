import 'package:flutter/material.dart';
import 'package:lytiq/admin_panel/dash_board_over_view/dash_board_over_view_viewModel.dart';
import 'package:lytiq/admin_panel/live_matches_control/live_matches_view_model.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/ui/custom_widget/custom_scaffold/custom_scaffold.dart';
import 'package:provider/provider.dart';

class LiveMatchesScreen extends StatelessWidget {
  const LiveMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LiveMatchesViewModel(),
      child: Consumer<LiveMatchesViewModel>(
        builder: (context, vm, child) => SafeArea(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: Center(
              child: Text(
                'live matches screen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
