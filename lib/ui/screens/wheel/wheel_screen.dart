import 'package:flutter/material.dart';
import 'package:lytiq/ui/custom_widget/custom_scaffold/custom_scaffold.dart';
import 'package:lytiq/ui/screens/wheel/wheel_view_model.dart';
import 'package:provider/provider.dart';

class WheelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WheelViewModel(),
      child: Consumer<WheelViewModel>(
        builder: (context, value, child) =>
            CustomScaffold(body: Column(children: [])),
      ),
    );
  }
}
