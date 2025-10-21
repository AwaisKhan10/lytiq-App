import 'package:flutter/material.dart';
import 'package:lytiq/ui/screens/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) =>
            Scaffold(body: Center(child: Text("Awais khan"))),
      ),
    );
  }
}
