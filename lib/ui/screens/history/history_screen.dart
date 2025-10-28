import 'package:flutter/material.dart';
import 'package:lytiq/ui/custom_widget/custom_scaffold/custom_scaffold.dart';
import 'package:lytiq/ui/screens/history/history_view_model.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HistoryViewModel(),
      child: Consumer<HistoryViewModel>(
        builder: (context, value, child) =>
            CustomScaffold(body: Column(children: [])),
      ),
    );
  }
}
