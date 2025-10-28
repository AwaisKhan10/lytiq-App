import 'package:flutter/material.dart';
import 'package:lytiq/ui/custom_widget/custom_scaffold/custom_scaffold.dart';
import 'package:lytiq/ui/screens/support/support_view_model.dart';
import 'package:provider/provider.dart';

class SupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SupportViewModel(),
      child: Consumer<SupportViewModel>(
        builder: (context, value, child) =>
            CustomScaffold(body: Column(children: [])),
      ),
    );
  }
}
